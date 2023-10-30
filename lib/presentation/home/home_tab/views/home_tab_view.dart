import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/extensions/integer_ext.dart';
import 'package:let_tutor/core/mixin/jitsi_meeting_mixin.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/presentation/app_setting/bloc/app_setting_bloc.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/home/home_tab/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/schedule/upcoming/bloc/upcoming_bloc.dart';
import 'package:localization/generated/l10n.dart';

import '../../../../core/components/tutors/tutor_card.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView>
    with LoadMoreMixin, JistiMeetingMixin {
  TutorBloc get tutorBloc => context.read<TutorBloc>();
  AuthBloc get authBloc => context.read<AuthBloc>();
  UpcomingBloc get upcomingBloc => context.read<UpcomingBloc>();

  String get langCode => context.read<AppSettingBloc>().state.langCode;

  @override
  void listener() {
    if (isBottom && tutorBloc.state.isLoading == false) {
      tutorBloc.add(FetchTutor());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        tutorBloc.add(RefreshTutor());
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200,
              color: context.primaryColor,
              child: BlocBuilder<UpcomingBloc, UpcomingState>(
                builder: (_, state) {
                  final now = DateTime.now().millisecondsSinceEpoch;
                  final upcomingLesson =
                      state.upcomingClasses?.firstWhereOrNull((e) {
                    final scheduleInfo = e.scheduleDetailInfo?.scheduleInfo;
                    return scheduleInfo != null &&
                        ((scheduleInfo.startTimestamp != null &&
                                scheduleInfo.startTimestamp! <= now &&
                                scheduleInfo.endTimestamp != null &&
                                scheduleInfo.endTimestamp! >= now) ||
                            scheduleInfo.startTimestamp != null &&
                                scheduleInfo.startTimestamp! >= now);
                  });

                  if (upcomingLesson == null) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).welcomeToLetTutor,
                          style: context.textTheme.headlineSmall?.copyWith(
                            color: context.backgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).noUpcommingLesson,
                          style: context.textTheme.titleLarge?.copyWith(
                            color: context.backgroundColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          S.of(context).totalLessionIs(
                              ((authBloc.state.totalLearning ?? 0) ~/ 60),
                              (authBloc.state.totalLearning ?? 0) % 60),
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.backgroundColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 3),
                      ],
                    );
                  }
                  final scheduleInfo =
                      upcomingLesson.scheduleDetailInfo!.scheduleInfo;

                  final startTime =
                      (scheduleInfo!.startTimestamp ?? 0).toyMMMEdFormat();
                  final startHour = (scheduleInfo.startTimestamp ?? 0)
                      .toDateTime('HH:mm', langCode);
                  final endHour = (scheduleInfo.endTimestamp ?? 0)
                      .toDateTime('HH:mm', langCode);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).upcomingLesson,
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: context.backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '$startTime, $startHour - $endHour',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.backgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: context.primaryColor,
                          backgroundColor: context.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          onTapEnterLessonRoom(
                              upcomingLesson.studentMeetingLink,
                              upcomingLesson
                                  .scheduleDetailInfo!.startPeriodTimestamp!);
                        },
                        icon: const Icon(Icons.play_circle_outline),
                        label: Text(S.of(context).enterLessonRoom),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).totalLessionIs(
                            ((authBloc.state.totalLearning ?? 0) ~/ 60),
                            (authBloc.state.totalLearning ?? 0) % 60),
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.backgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 3),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 30),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<TutorBloc, TutorState>(
                builder: (_, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).recommendedTutors,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.textColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (state.tutors != null)
                        ...List.generate(
                          state.tutors!.length,
                          (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: TutorCardWidget(
                                tutor: state.tutors![index],
                              ),
                            );
                          },
                        ),
                      if (state.isLoading)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state.hasReachedMax)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text(S.of(context).noDataResponse),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

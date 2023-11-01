import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/mixin/jitsi_meeting_mixin.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/presentation/schedule/upcoming/bloc/upcoming_bloc.dart';
import 'package:let_tutor/presentation/schedule/upcoming/views/upcoming_card.dart';
import 'package:localization/localization.dart';

class UpcomingTabView extends StatefulWidget {
  const UpcomingTabView({super.key});

  @override
  State<UpcomingTabView> createState() => _UpcomingTabViewState();
}

class _UpcomingTabViewState extends State<UpcomingTabView>
    with LoadMoreMixin, JistiMeetingMixin {
  bool isMeeting = false;

  @override
  void listener() {
    if (isBottom && context.read<UpcomingBloc>().state.isLoading == false) {
      context.read<UpcomingBloc>().add(FetchUpcoming());
    }
  }

  void onTapCancelBookedClass(String id) {
    context
        .read<UpcomingBloc>()
        .add(CancelUpcomingClassEvent(scheduleDetailId: id));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UpcomingBloc>().add(FetchUpcoming());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<UpcomingBloc, UpcomingState>(
          listener: (_, state) {
            if (state is UpcomingSuccess && state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          builder: (_, state) {
            if ((state.upcomingClasses?.isEmpty ?? true) &&
                state.isLoading == false) {
              return Center(
                child: Text(
                  S.of(context).noUpcomingClass,
                  style: context.textTheme.titleLarge,
                ),
              );
            }
            return Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 16),
                    ...List<Widget>.generate(
                      state.upcomingClasses?.length ?? 0,
                      (index) {
                        final upcomingClass = state.upcomingClasses![index];
                        final scheduleDetailInfo =
                            upcomingClass.scheduleDetailInfo;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: UpcomingCardWidget(
                            scheduleInfo: scheduleDetailInfo?.scheduleInfo,
                            request: upcomingClass.studentRequest,
                            onTapGoToMeeting: () => onTapEnterLessonRoom(
                              upcomingClass.studentMeetingLink,
                              upcomingClass.scheduleDetailInfo
                                      ?.startPeriodTimestamp ??
                                  0,
                            ),
                            onTapCancelMeeting: () =>
                                onTapCancelBookedClass(upcomingClass.id!),
                          ),
                        );
                      },
                    ),
                    if (state.isLoading)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    const SizedBox(height: 16),
                  ],
                ),
                if (state.isLoadingCancel)
                  Positioned.directional(
                    end: 0,
                    top: 0,
                    textDirection: Directionality.of(context),
                    child: const CircularProgressIndicator(),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}

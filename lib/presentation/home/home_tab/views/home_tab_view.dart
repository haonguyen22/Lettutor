import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/presentation/home/home_tab/bloc/tutor_bloc.dart';
import 'package:localization/generated/l10n.dart';

import '../../../../core/components/tutors/tutor_card.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> with LoadMoreMixin {
  @override
  void listener() {
    if (isBottom && context.read<TutorBloc>().state.isLoading == false) {
      context.read<TutorBloc>().add(FetchTutor());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TutorBloc>().add(RefreshTutor());
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            leadingWidth: 150,
            flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).noUpcommingLesson,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.backgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).welcomeToLetTutor,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.backgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
                centerTitle: true,
                background: Container(
                  color: context.primaryColor,
                  width: double.infinity,
                )),
            expandedHeight: 200,
            collapsedHeight: 90,
            backgroundColor: context.primaryColor,
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

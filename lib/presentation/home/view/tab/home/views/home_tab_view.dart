import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/presentation/home/view/tab/home/bloc/tutor_bloc.dart';
import 'package:localization/generated/l10n.dart';

import '../../../../../../core/components/tutors/tutor_card.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final ScrollController _scrollController = ScrollController();

  void _onScroll() {
    if (_isBottom && context.read<TutorBloc>().state.isLoading == false) {
      context.read<TutorBloc>().add(FetchTutor());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TutorBloc>().add(RefreshTutor());
      },
      child: CustomScrollView(
        controller: _scrollController,
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
                            final tutor = state.tutors![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: TutorCardWidget(
                                name: tutor.name,
                                imageUrl: tutor.imageUrl,
                                description: tutor.bio,
                                tags: tutor.specialties?.split(','),
                                country: tutor.country,
                                rating: tutor.rating?.floor() ?? 0,
                                isFavorite: tutor.isFavorite ?? false,
                              ),
                            );
                          },
                        ),
                      if (state.isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state.hasReachedMax)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("End data"),
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

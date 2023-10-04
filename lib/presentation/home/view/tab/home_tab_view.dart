import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:localization/generated/l10n.dart';

import '../../../../components/tutors/tutor_card.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            child: Column(
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
                ...List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: TutorCardWidget(
                      name: 'Dang Thu Ha (Lucy)',
                      imageUrl:
                          'https://api.app.lettutor.com/avatar/7f663cef-2529-4f01-9c25-e71300727b56avatar1686546526450.jpg',
                      description:
                          'Hello! I am Teacher Charis from the Philippines. I have offline and online teaching experience. I completed my degree as an English Major. I am patient, enthusiastic, and passionate when it comes to teaching, particularly in English language. If you want an engaging class with me, do not hesitate to be my student. Teacher Charis at your service!',
                      tags: [
                        "English for kids",
                        "English for Business",
                        "Conversational",
                        "STARTERS"
                      ],
                      country: "Philippines",
                      rating: 5,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

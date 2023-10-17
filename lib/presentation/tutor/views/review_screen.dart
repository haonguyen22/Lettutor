import 'package:flutter/material.dart';
import 'package:let_tutor/core/components/tutors/tutor_review.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:localization/generated/l10n.dart';

class ReviewScreen extends StatelessWidget {
  final Tutor tutor;
  const ReviewScreen({
    super.key,
    required this.tutor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                S.of(context).review,
                style: TextStyle(color: context.textColor),
              ),
              background: Container(
                color: context.primaryColor.withOpacity(0.4),
                width: double.infinity,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12.0, vertical: 16.0),
            sliver: SliverToBoxAdapter(
              child: (tutor.feedbacks?.isNotEmpty ?? false)
                  ? Column(
                      children: List.generate(
                        tutor.feedbacks?.length ?? 0,
                        (index) {
                          final feedback = tutor.feedbacks?[index];
                          return Padding(
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 12.0),
                            child: TutorReviewWidget(
                              feedback: feedback?.content ?? "",
                              imageUrl: feedback?.info?.avatar,
                              name: feedback?.info?.name,
                              rating: tutor.rating?.floor(),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        S.of(context).noReview,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

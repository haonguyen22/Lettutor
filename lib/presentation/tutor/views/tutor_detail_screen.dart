import 'package:flutter/material.dart';
import 'package:let_tutor/core/constants/colors.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/video.dart';
import 'package:let_tutor/core/widget/wrap_list.dart';
import 'package:localization/generated/l10n.dart';

import '../../../core/widget/icon_label.dart';

const _kDefaultImage = "assets/icons/logo.png";

class TutorDetailScreen extends StatefulWidget {
  final String? imageUrl;
  final String name;
  final String? country;

  const TutorDetailScreen({
    super.key,
    this.imageUrl =
        'https://api.app.lettutor.com/avatar/7f663cef-2529-4f01-9c25-e71300727b56avatar1686546526450.jpg',
    this.name = "Dang Thu Ha",
    this.country = "Viet nam",
  });

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.name,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: widget.imageUrl != null
                                ? Image.network(
                                    widget.imageUrl!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    _kDefaultImage,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: context.textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  ...List.generate(
                                    5,
                                    (index) {
                                      return Icon(
                                        index < 3
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 16,
                                        color: starColor,
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '(282)',
                                  ),
                                ],
                              ),
                              if (widget.country?.isNotEmpty ?? false)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    widget.country!,
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).hintColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'I was teaching English for almost 3 years. I am a Licensed Professional Teacher and a TESOL certified, I teach kids, adult and professionals. I make sure my class is students-centered. I will help you with your English goal. ',
                      style: context.textTheme.labelLarge,
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconLabelWidget(
                            icon: Icons.favorite_outline,
                            label: S.of(context).favorite,
                          ),
                          IconLabelWidget(
                            icon: Icons.info_outline,
                            label: S.of(context).report,
                          ),
                          IconLabelWidget(
                            icon: Icons.reviews_outlined,
                            label: S.of(context).review,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: CustomVideoPlayerWidget(
                          'https://www.youtube.com/watch?v=KyXKGurjX_4&list=RDGpmOn4RyzZI&index=6'),
                    ),
                    const SizedBox(height: 12),
                    TuturInfoItemWidget(
                      label: S.of(context).education,
                      content: Text(
                        "BAchelor of information technology",
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    TuturInfoItemWidget(
                      label: S.of(context).language,
                      content: const WrapListWidget(
                        listItem: ["english", "france"],
                      ),
                    ),
                    TuturInfoItemWidget(
                      label: S.of(context).specialities,
                      content: const WrapListWidget(
                        listItem: ["english for kids", "france for babe"],
                      ),
                    ),
                    TuturInfoItemWidget(
                      label: S.of(context).interests,
                      content: Text(
                        'I want to help my students broaden their opportunities, such as advancing in their careers or excelling in school, through learning English. I want to make a positive impact on the future of children and hopefully encourage them to be lifelong learners.',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    TuturInfoItemWidget(
                      label: S.of(context).teachingExperience,
                      content: Text(
                        'I want to help my students broaden their opportunities, such as advancing in their careers or excelling in school, through learning English. I want to make a positive impact on the future of children and hopefully encourage them to be lifelong learners.',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TuturInfoItemWidget extends StatelessWidget {
  final String label;
  final Widget? content;

  const TuturInfoItemWidget({
    super.key,
    required this.label,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: content,
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}

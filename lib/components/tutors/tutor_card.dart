import 'package:flutter/material.dart';
import 'package:let_tutor/core/constants/colors.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/wrap_list.dart';
import 'package:localization/generated/l10n.dart';

const _kDefaultImage = "assets/icons/logo.png";
const _kMaxRating = 5;

class TutorCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String? country;
  final int rating;
  final List<String>? tags;
  final String? description;

  const TutorCardWidget({
    super.key,
    this.imageUrl,
    required this.name,
    this.country,
    this.rating = 0,
    this.tags,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(8.0),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: imageUrl != null
                        ? Image.network(
                            imageUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            _kDefaultImage,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.55,
                        child: Text(
                          name,
                          style: context.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (country?.isNotEmpty ?? false)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            country!,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      Row(
                        children: List.generate(
                          _kMaxRating,
                          (index) {
                            return Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              size: 16,
                              color: starColor,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              WrapListWidget(listItem: tags),
              if (description?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    description!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(height: 1.5),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: context.primaryColor,
                      ),
                    ),
                    foregroundColor: context.primaryColor,
                    shadowColor: Colors.transparent,
                  ),
                  icon: const Icon(Icons.book),
                  label: Text(S.of(context).book),
                ),
              ),
            ],
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite_outline,
                color: context.primaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

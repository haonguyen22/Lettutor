import 'package:flutter/material.dart';
import 'package:let_tutor/core/constants/colors.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

const _kDefaultImage = "assets/icons/logo.png";
const sizeImage = 75.0;
const padding = 8.0;

class TutorReviewWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final int? rating;
  final String? feedback;
  const TutorReviewWidget({
    super.key,
    this.imageUrl,
    this.name,
    this.rating,
    this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(padding),
      margin: const EdgeInsets.all(2),
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
      constraints: const BoxConstraints(
        minHeight: sizeImage + padding * 2,
        maxHeight: sizeImage + padding * 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(sizeImage * 0.6),
                      child: Image.network(
                        imageUrl!,
                        width: sizeImage * 0.6,
                        height: sizeImage * 0.6,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          _kDefaultImage,
                          width: sizeImage * 0.6,
                          height: sizeImage * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(sizeImage * 0.6),
                      child: Image.asset(
                        _kDefaultImage,
                        width: sizeImage * 0.6,
                        height: sizeImage * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? "",
                          style: context.textTheme.bodyLarge,
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                index < (rating?.floor() ?? 0)
                                    ? Icons.star
                                    : Icons.star_border,
                                size: 13,
                                color: starColor,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      feedback ?? "",
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

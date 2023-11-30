import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/dummy/data.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';

class CourseCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String? country;
  final String? description;
  final String? level;
  final int? numOfLesson;
  final VoidCallback? onTap;

  const CourseCardWidget({
    super.key,
    this.imageUrl,
    required this.name,
    this.country,
    this.description,
    this.numOfLesson,
    this.level,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    void onTapItem() {
      if (onTap != null) {
        onTap?.call();
        return;
      }
      Navigator.of(context).pushNamed(RouteList.courseDetail);
    }

    final levelInt = int.parse(level ?? '0');
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
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
              blurRadius: 1,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsetsDirectional.only(top: 14.0),
              child: Text(
                name,
                style: context.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    levelInt > 6
                        ? levels['6']!['value']!
                        : levels['$levelInt']!['value']!,
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  Text(
                    S.of(context).numOfLessons(numOfLesson ?? 0),
                    style: TextStyle(color: Theme.of(context).hintColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

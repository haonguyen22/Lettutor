import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:localization/localization.dart';

const _kDefaultImage = "assets/icons/logo.png";

class HistoryCardWidget extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onTap;
  final String name;
  final DateTime? date;
  final String? timeRange;

  const HistoryCardWidget({
    super.key,
    this.imageUrl,
    required this.onTap,
    required this.name,
    this.date,
    this.timeRange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(
          start: 16.0, end: 16, top: 8.0, bottom: 5.0),
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
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl!,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          _kDefaultImage,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Text(
                          name,
                          style: context.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (date != null)
                        Text(
                          DateFormat("dd-MM-yyyy").format(
                            date!,
                          ),
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.textColor?.withOpacity(0.7)),
                        ),
                      if (timeRange != null)
                        Text(
                          timeRange!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.of(context).report,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.of(context).addAReview,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

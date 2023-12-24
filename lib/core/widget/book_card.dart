import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:localization/localization.dart';

class BookCardWidget extends StatelessWidget {
  final DateTime date;
  final String? startTime;
  final String? endTime;
  final bool isBooked;
  final bool isBookedBySelf;
  final VoidCallback? onTap;

  const BookCardWidget({
    super.key,
    required this.date,
    this.startTime,
    this.endTime,
    required this.isBooked,
    required this.isBookedBySelf,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 8),
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
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            DateFormat.yMEd().format(date),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                startTime ?? '',
                style: context.textTheme.bodyLarge?.copyWith(),
              ),
            ),
            Text(
              ' - ',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.red.withOpacity(0.3),
              ),
              child: Text(
                endTime ?? '',
                style: context.textTheme.bodyLarge?.copyWith(),
              ),
            )
          ],
        ),
        trailing: ElevatedButton(
          onPressed: !isBooked ? onTap : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isBooked
                ? isBookedBySelf
                    ? Colors.green
                    : Colors.grey
                : context.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            isBooked
                ? isBookedBySelf
                    ? S.of(context).booked
                    : S.of(context).reserved
                : S.of(context).book,
            style: context.textTheme.bodyMedium?.copyWith(
              color: isBookedBySelf ? Colors.green : context.textColor,
              fontWeight: isBookedBySelf ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

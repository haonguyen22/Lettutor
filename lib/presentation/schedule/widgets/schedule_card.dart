import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/extensions/integer_ext.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';
import 'package:let_tutor/dummy/country.dart';
import 'package:localization/localization.dart';

const _kDefaultImage = "assets/icons/logo.png";

class ScheduleCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final ScheduleInfoModel? scheduleInfo;
  final String? request;

  const ScheduleCardWidget({
    super.key,
    required this.onTap,
    this.scheduleInfo,
    this.request,
  });

  @override
  Widget build(BuildContext context) {
    final tutor = scheduleInfo?.tutorInfo?.toEntity();
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
            Text(
              (scheduleInfo?.startTimestamp ?? 0).toyMMMEdFormat(),
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  S.of(context).lessonTime,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    (scheduleInfo?.startTimestamp ?? 0).toDateTime('HH:mm'),
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
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.red.withOpacity(0.3),
                  ),
                  child: Text(
                    (scheduleInfo?.endTimestamp ?? 0).toDateTime('HH:mm'),
                    style: context.textTheme.bodyLarge?.copyWith(),
                  ),
                )
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: tutor?.imageUrl != null
                      ? Image.network(
                          tutor!.imageUrl!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          _kDefaultImage,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Text(
                          tutor?.name ?? "",
                          style: context.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (tutor?.country?.isNotEmpty ?? false)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            countryList[tutor?.country!] ??
                                tutor?.country ??
                                "",
                            style: context.textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(S.of(context).studentRequest(request ?? "")),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).report,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).addAReview,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.blue,
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

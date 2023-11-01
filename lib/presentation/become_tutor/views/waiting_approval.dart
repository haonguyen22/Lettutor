import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:localization/localization.dart';

class WaitingApprovalStep extends StatelessWidget {
  final VoidCallback onBackHome;
  const WaitingApprovalStep({
    super.key,
    required this.onBackHome,
  });

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).doneAllSteps,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).waitForApproval,
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: context.widthDevice,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
            ),
            onPressed: onBackHome,
            child: Text(S.of(context).backHome),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

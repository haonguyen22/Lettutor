import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class ColumnInfoDetailWidget extends StatelessWidget {
  final Icon? icon;
  final String label;
  final Widget? content;

  const ColumnInfoDetailWidget({
    super.key,
    this.icon,
    required this.label,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ],
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

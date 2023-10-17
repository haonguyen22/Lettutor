import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class IconLabelWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isRowWidget;
  final VoidCallback? onTap;
  const IconLabelWidget({
    super.key,
    required this.icon,
    required this.label,
    this.isRowWidget = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: isRowWidget
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: context.primaryColor,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: context.primaryColor),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: context.primaryColor,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: context.primaryColor),
                ),
              ],
            ),
    );
  }
}

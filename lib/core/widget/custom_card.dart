import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class CustomCardWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Icon? icon;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool showArrowIcon;

  const CustomCardWidget({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.backgroundColor,
    this.trailing,
    this.showArrowIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        surfaceTintColor: context.primaryColor,
        color: backgroundColor,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 12),
                  ],
                  Text(
                    label,
                    style: context.textTheme.titleMedium,
                  )
                ],
              ),
              Row(
                children: [
                  if (trailing != null) ...[
                    trailing!,
                    const SizedBox(width: 10),
                  ],
                  if (showArrowIcon)
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: context.textColor?.withOpacity(0.3),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

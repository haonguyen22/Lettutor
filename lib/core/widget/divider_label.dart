import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class DividerLabelWidget extends StatelessWidget {
  final String label;

  const DividerLabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            label,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(width: 10),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}

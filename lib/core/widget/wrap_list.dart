import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class WrapListWidget<T> extends StatefulWidget {
  final int? currentIndex;
  final List<String>? listLabel;
  final Function(int)? onTap;

  const WrapListWidget({
    super.key,
    this.currentIndex,
    this.listLabel,
    this.onTap,
  });

  @override
  State<WrapListWidget> createState() => _WrapListWidgetState();
}

class _WrapListWidgetState extends State<WrapListWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 10,
      children: List.generate(
        widget.listLabel?.length ?? 0,
        (index) => GestureDetector(
          onTap: () => widget.onTap?.call(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: widget.currentIndex == index || widget.onTap == null
                  ? context.primaryColor.withOpacity(0.15)
                  : context.textColor?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              widget.listLabel![index],
              style: context.textTheme.bodySmall?.copyWith(
                color: widget.currentIndex == index || widget.onTap == null
                    ? context.primaryColor
                    : context.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

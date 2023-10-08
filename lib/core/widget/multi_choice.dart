import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class MultiChoiceWidget<T> extends StatefulWidget {
  final List<T>? listItemChoice;
  final List<T>? listItem;
  final Function(int)? onTap;

  const MultiChoiceWidget({
    super.key,
    this.listItemChoice,
    this.listItem,
    this.onTap,
  });

  @override
  State<MultiChoiceWidget> createState() => _MultiChoiceWidgetState();
}

class _MultiChoiceWidgetState extends State<MultiChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      runSpacing: 10,
      children: List.generate(widget.listItem?.length ?? 0, (index) {
        final isContain =
            (widget.listItemChoice?.contains(widget.listItem?[index]) ?? false);
        final isSelected = isContain || widget.onTap == null;
        return GestureDetector(
          onTap: () => widget.onTap?.call(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.primaryColor.withOpacity(0.15)
                  : context.textColor?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isContain)
                  Icon(
                    Icons.check,
                    size: 18,
                    color: context.primaryColor,
                  ),
                Text(
                  widget.listItem![index],
                  style: context.textTheme.bodySmall?.copyWith(
                    color:
                        isSelected ? context.primaryColor : context.textColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

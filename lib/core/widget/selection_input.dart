import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SelectionInputWidget<T> extends StatefulWidget {
  final String label;
  final List<T> listValue;
  final List<String> listLabel;
  final Function(T?)? onSelected;
  final T? initialSelection;

  const SelectionInputWidget({
    super.key,
    required this.label,
    required this.listValue,
    required this.listLabel,
    required this.onSelected,
    this.initialSelection,
  });
  @override
  State<SelectionInputWidget<T>> createState() =>
      _SelectionInputWidgetState<T>();
}

class _SelectionInputWidgetState<T> extends State<SelectionInputWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 8.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, BoxConstraints constrained) {
            return DropdownMenu<T>(
              initialSelection: widget.initialSelection,
              width: constrained.maxWidth,
              onSelected: widget.onSelected,
              dropdownMenuEntries:
                  widget.listValue.mapIndexed<DropdownMenuEntry<T>>(
                (int index, T value) {
                  return DropdownMenuEntry<T>(
                    value: value,
                    label: widget.listLabel[index],
                  );
                },
              ).toList(),
            );
          },
        ),
      ],
    );
  }
}

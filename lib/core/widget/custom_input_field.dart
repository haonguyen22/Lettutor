import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class CustomInputLabelField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscure;
  final String? hintText;
  final String? Function(String? input)? onValidator;

  const CustomInputLabelField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.isObscure = false,
    this.onValidator,
  });

  @override
  State<CustomInputLabelField> createState() => _CustomInputLabelFieldState();
}

class _CustomInputLabelFieldState extends State<CustomInputLabelField> {
  bool _showCancelIconInState = true;

  void tapShowHideText() {
    setState(() {
      _showCancelIconInState = !_showCancelIconInState;
    });
  }

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
              color: context.textColor,
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).hintColor.withOpacity(0.2),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            suffixIcon: widget.isObscure
                ? GestureDetector(
                    onTap: tapShowHideText,
                    child: _showCancelIconInState
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  )
                : null,
          ),
          autovalidateMode: AutovalidateMode.always,
          controller: widget.controller,
          obscureText: widget.isObscure && _showCancelIconInState,
          validator: widget.onValidator,
        ),
      ],
    );
  }
}

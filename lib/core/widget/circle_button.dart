import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';

class CircleButton extends StatelessWidget {
  final String? image;
  final Widget? imageWidget;
  final double radius;
  final Color? color;

  const CircleButton({
    this.image,
    this.imageWidget,
    Key? key,
    required this.radius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      height: radius * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color ?? context.primaryColor,
      ),
      child: (image?.isNotEmpty ?? false) || imageWidget != null
          ? imageWidget ??
              Image.asset(
                image!,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              )
          : const SizedBox(),
    );
  }
}

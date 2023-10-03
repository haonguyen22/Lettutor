import 'package:flutter/material.dart';

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
        color: color ?? Theme.of(context).primaryColor,
      ),
      child: (image?.isNotEmpty ?? false) || imageWidget != null
          ? imageWidget ??
              Image.asset(
                image!,
                width: 25,
                height: 20,
                fit: BoxFit.cover,
              )
          : const SizedBox(),
    );
  }
}
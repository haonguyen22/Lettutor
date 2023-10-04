import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAppWidget extends StatelessWidget {
  const LogoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8.0),
      width: 150,
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        fit: BoxFit.contain,
      ),
    );
  }
}

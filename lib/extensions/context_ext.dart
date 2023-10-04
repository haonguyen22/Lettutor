import 'package:flutter/material.dart';

extension ContextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color? get textColor => Theme.of(this).textTheme.bodyLarge?.color;
}

import 'package:flutter/material.dart';
import 'package:let_tutor/constants/route_list.dart';
import 'package:let_tutor/presentation/auth/login/login_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static final Map<String, WidgetBuilder> _routes = {
    RouteList.login: (context) => const LoginScreen(),
  };
}

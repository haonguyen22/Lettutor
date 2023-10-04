import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/home/view/home_screen.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/presentation/auth/view/auth_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static final Map<String, WidgetBuilder> _routes = {
    RouteList.home: (context) => const HomeScreen(),
    RouteList.login: (context) => const AuthScreen.login(),
    RouteList.signUp: (context) => const AuthScreen.signUp(),
  };
}

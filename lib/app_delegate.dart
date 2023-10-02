import 'dart:async';
import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/auth/login/login_screen.dart';

import 'application.dart';

// import 'data/datasource/local/preferences.dart';
final rootNavigationKey = GlobalKey<NavigatorState>();

class AppDelegate {
  Future<Widget> build() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    return Application(
      title: 'LetTutor',
      navigationKey: rootNavigationKey,
      providers: const [],
      themeSaved: savedThemeMode,
      initialRoute: LoginScreen.routeName,
    );
  }

  Future<void> run() async {
    await runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      final app = await build();

      runApp(app);
    }, (e, trace) {
      log('[AppDelegate]: ${e.toString()}  ${trace.toString()}');
    });
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/home/view/tab/home/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/home/view/tab/tutors/bloc/search_tutor_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/core/dependency_injection/di.dart';
import 'package:let_tutor/presentation/app_setting/bloc/app_setting_bloc.dart';

import 'application.dart';

// import 'data/datasource/local/preferences.dart';
final rootNavigationKey = GlobalKey<NavigatorState>();

class AppDelegate {
  Future<Widget> build() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    return Application(
      title: 'LetTutor',
      navigationKey: rootNavigationKey,
      providers: [
        BlocProvider<AppSettingBloc>(create: (_) => injector.get()),
        BlocProvider<AuthBloc>(create: (_) => injector.get()),
        BlocProvider<TutorBloc>(
            create: (_) => injector.get<TutorBloc>()..add(FetchTutor())),
        BlocProvider<SearchTutorBloc>(create: (_) => injector.get()),
      ],
      themeSaved: savedThemeMode,
      initialRoute: RouteList.login,
    );
  }

  Future<void> run() async {
    await runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      configurationInjection();

      final app = await build();

      runApp(app);
    }, (e, trace) {
      log('${e.toString()}  ${trace.toString()}');
    });
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/configurations/configurations.dart';
import 'package:let_tutor/env.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/home/course_tab/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/home/tutor_tab/bloc/search_tutor_bloc.dart';
import 'package:let_tutor/presentation/home/home_tab/bloc/tutor_bloc.dart';
import 'package:let_tutor/presentation/schedule/history/bloc/history_bloc.dart';
import 'package:let_tutor/presentation/schedule/upcoming/bloc/upcoming_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/core/dependency_injection/di.dart';
import 'package:let_tutor/presentation/app_setting/bloc/app_setting_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
        BlocProvider<CourseBloc>(
            create: (_) => injector.get()..add(FetchCourseEvent())),
        BlocProvider<HistoryBloc>(
            create: (_) => injector.get()..add(FetchHistoryPagination())),
        BlocProvider<UpcomingBloc>(
            create: (_) => injector.get()..add(FetchUpcoming())),
      ],
      themeSaved: savedThemeMode,
      initialRoute: RouteList.login,
    );
  }

  Future<void> run() async {
    await runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      Configurations().setConfigurationValues(environment);

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      configurationInjection();

      final app = await build();

      runApp(app);
    }, (e, trace) {
      log('${e.toString()}  ${trace.toString()}');
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/dependency_injection/di.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/course/views/course_detail_screen.dart';
import 'package:let_tutor/presentation/course/views/course_topic_detail_screen.dart';
import 'package:let_tutor/presentation/home/view/home_screen.dart';
import 'package:let_tutor/presentation/profile/views/profile_screen.dart';
import 'package:let_tutor/presentation/tutor/views/tutor_detail_screen.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/presentation/auth/view/auth_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static final Map<String, WidgetBuilder> _routes = {
    RouteList.home: (context) => const HomeScreen(),
    RouteList.tutorDetail: (context) => const TutorDetailScreen(),
    RouteList.courseDetail: (context) => const CourseDetailScreen(),
    RouteList.profile: (context) => const ProfileScreen(),
  };

  static Route getRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.login:
        return _buildRoute(
          settings,
          (_) => BlocProvider<AuthBloc>(
            create: (context) => injector.get(),
            child: const AuthScreen.login(),
          ),
        );

      case RouteList.signUp:
        return _buildRoute(
          settings,
          (_) => BlocProvider<AuthBloc>(
            create: (context) => injector.get(),
            child: const AuthScreen.signUp(),
          ),
        );

      case RouteList.courseTopicDetail:
        if (settings.arguments is CourseTopicDetailArgument) {
          final data = settings.arguments as CourseTopicDetailArgument;
          return _buildRoute(
            settings,
            (context) => CourseTopicDetailScreen(data: data),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _buildRoute(
      RouteSettings settings, WidgetBuilder builder,
      {bool fullscreenDialog = false}) {
    return MaterialPageRoute(
      settings: settings,
      builder: builder,
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route _errorRoute([String message = 'Page not founds']) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(message),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/dependency_injection/di.dart';
import 'package:let_tutor/core/widget/countdown_screen.dart';
import 'package:let_tutor/domain/entities/course.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/presentation/auth/view/forgot_password_screen.dart';
import 'package:let_tutor/presentation/become_tutor/bloc/become_tutor_bloc.dart';
import 'package:let_tutor/presentation/become_tutor/views/become_tutor_screen.dart';
import 'package:let_tutor/presentation/course/views/course_detail_screen.dart';
import 'package:let_tutor/presentation/course/views/course_topic_detail_screen.dart';
import 'package:let_tutor/presentation/home/home_screen.dart';
import 'package:let_tutor/presentation/profile/views/profile_screen.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_detail_bloc.dart';
import 'package:let_tutor/presentation/tutor/views/review_screen.dart';
import 'package:let_tutor/presentation/tutor/views/tutor_detail_screen.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/presentation/auth/view/auth_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static final Map<String, WidgetBuilder> _routes = {
    RouteList.login: (context) => const AuthScreen.login(),
    RouteList.signUp: (context) => const AuthScreen.signUp(),
    RouteList.forgotPassword: (context) => const ForgotPasswordScreen(),
    RouteList.profile: (context) => const ProfileScreen(),
  };

  static Route getRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.home:
        return _buildRoute(
          settings,
          (context) => const HomeScreen(),
        );

      case RouteList.review:
        if (settings.arguments is Tutor) {
          final data = settings.arguments as Tutor;
          return _buildRoute(
            settings,
            (context) => ReviewScreen(tutor: data),
          );
        }
        return _errorRoute();
      case RouteList.waiting:
        if (settings.arguments is Map<String, dynamic>) {
          final data = settings.arguments as Map<String, dynamic>;
          return _buildRoute(
            settings,
            (context) => CountDownScreen(
              startTimestamp: data["startTimestamp"],
              url: data["url"],
            ),
          );
        }
        return _errorRoute();
      case RouteList.becomeTutor:
        return _buildRoute(
          settings,
          (context) => BlocProvider<BecomeTutorBloc>(
              create: (context) => injector.get<BecomeTutorBloc>(),
              child: const BecomeTutorScreen()),
        );

      case RouteList.courseDetail:
        if (settings.arguments is Course) {
          final data = settings.arguments as Course;
          return _buildRoute(
            settings,
            (context) => CourseDetailScreen(course: data),
          );
        }
        return _errorRoute();

      case RouteList.courseTopicDetail:
        if (settings.arguments is CourseTopicDetailArgument) {
          final data = settings.arguments as CourseTopicDetailArgument;
          return _buildRoute(
            settings,
            (context) => CourseTopicDetailScreen(data: data),
          );
        }
        return _errorRoute();

      case RouteList.tutorDetail:
        if (settings.arguments is Tutor) {
          final data = settings.arguments as Tutor;
          return _buildRoute(
            settings,
            (context) => BlocProvider<TutorDetailBloc>(
              create: (context) => injector.get<TutorDetailBloc>(
                param1: data,
              ),
              child: const TutorDetailScreen(),
            ),
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

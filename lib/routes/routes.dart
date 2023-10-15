import 'package:flutter/material.dart';
import 'package:let_tutor/domain/entities/course.dart';
import 'package:let_tutor/presentation/course/views/course_detail_screen.dart';
import 'package:let_tutor/presentation/course/views/course_topic_detail_screen.dart';
import 'package:let_tutor/presentation/home/home_screen.dart';
import 'package:let_tutor/presentation/profile/views/profile_screen.dart';
import 'package:let_tutor/presentation/tutor/views/tutor_detail_screen.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:let_tutor/presentation/auth/view/auth_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static final Map<String, WidgetBuilder> _routes = {
    RouteList.tutorDetail: (context) => const TutorDetailScreen(),
    RouteList.login: (context) => const AuthScreen.login(),
    RouteList.signUp: (context) => const AuthScreen.signUp(),
    RouteList.profile: (context) => const ProfileScreen(),
  };

  static Route getRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.home:
        return _buildRoute(
          settings,
          (context) => const HomeScreen(),
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

import 'package:let_tutor/domain/entities/course.dart';

abstract class CourseRepository {
  Future<List<Course>?> getCourses({
    required int page,
    int size = 10,
    String search = "",
  });
  Future<Course?> getCourseById({
    required String id,
  });
}

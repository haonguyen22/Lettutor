import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/entities/course.dart';
import 'package:let_tutor/domain/repositories/course_repository.dart';

@injectable
class CourseUseCase {
  final CourseRepository _courseRepository;

  const CourseUseCase(this._courseRepository);

  Future<Course?> findCourseById({required String id}) async {
    return await _courseRepository.getCourseById(id: id);
  }

  Future<List<Course>?> getCoursesByPage(
      {required int page, int perPage = 10, String search = ""}) async {
    return await _courseRepository.getCourses(
      page: page,
      size: perPage,
      search: search,
    );
  }
}

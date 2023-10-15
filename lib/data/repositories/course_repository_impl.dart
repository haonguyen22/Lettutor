import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/course/course_service.dart';
import 'package:let_tutor/data/models/course/course_response.dart';
import 'package:let_tutor/data/models/course/course_single_response.dart';
import 'package:let_tutor/domain/entities/course.dart';
import 'package:let_tutor/domain/repositories/course_repository.dart';

@Injectable(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseService _courseService;

  CourseRepositoryImpl(this._courseService);

  @override
  Future<Course?> getCourseById({required String id}) async {
    CourseSingleResponse? res = await _courseService.getCourseById(id: id);
    return res?.data?.toEntity();
  }

  @override
  Future<List<Course>?> getCourses({
    required int page,
    int size = 10,
    String search = "",
  }) async {
    CourseResponse? res =
        await _courseService.getCourses(page: page, size: size, search: search);
    return res?.data?.rows?.toList().map((e) => e.toEntity()).toList();
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/course/course_response.dart';
import 'package:let_tutor/data/models/course/course_single_response.dart';
import 'package:retrofit/http.dart';

part 'course_service.g.dart';

@RestApi()
@injectable
abstract class CourseService {
  static const String courseApi = '/course';
  static const String getCourseByIDApi = '/course/{id}';

  @factoryMethod
  factory CourseService(Dio dio) = _CourseService;

  @GET(courseApi)
  Future<CourseResponse?> getCourses({
    @Query("page") required int page,
    @Query("size") required int size,
    @Query("q") required String search,
  });

  @GET(getCourseByIDApi)
  Future<CourseSingleResponse?> getCourseById({
    @Path("id") required String id,
  });
}

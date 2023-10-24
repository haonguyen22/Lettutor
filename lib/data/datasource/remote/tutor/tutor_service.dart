import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/tutor/search_tutor_response.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';
import 'package:let_tutor/data/models/tutor/tutors_response.dart';
import 'package:retrofit/http.dart';

part 'tutor_service.g.dart';

@RestApi()
@injectable
abstract class TutorService {
  static const String tutorMore = '/tutor/more';
  static const String tutorByID = '/tutor/{id}';
  static const String searchTutors = '/tutor/search';
  static const String addToFavorite = '/user/manageFavoriteTutor';
  static const String reportApi = '/report';
  static const String becomeTutorApi = '/tutor/register';

  @factoryMethod
  factory TutorService(Dio dio) = _TutorService;

  @GET(tutorMore)
  Future<TutorsResponse?> getTutors({
    @Query('perPage') int perPage = 10,
    @Query('page') required int page,
  });

  @GET(tutorByID)
  Future<TutorModel?> getTutorById({
    @Path() required String id,
  });

  @POST(searchTutors)
  Future<SearchTutorsResponse?> searchTutor({
    @Body() required Map<String, dynamic> body,
  });

  @POST(addToFavorite)
  Future<void> addTutorToFavorite({
    @Body() required Map<String, dynamic> body,
  });

  @POST(reportApi)
  Future<void> reportTutor({
    @Body() required Map<String, dynamic> body,
  });

  @PUT(becomeTutorApi)
  Future<void> becomeATutor({
    @Body() required Map<String, dynamic> body,
    @Header("Content-Type") required String contentType,
  });
}

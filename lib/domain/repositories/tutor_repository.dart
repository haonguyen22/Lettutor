import 'package:let_tutor/data/models/tutor/become_tutor_request.dart';
import 'package:let_tutor/data/models/tutor/search_tutor_response.dart';
import 'package:let_tutor/domain/entities/tutor.dart';

abstract class TutorRepository {
  Future<List<Tutor>?> getTutors({int perPage = 9, required int page});
  Future<Tutor?> getTutorById({required String id});
  Future<SearchTutorsResponse?> searchTutor(
      {required Map<String, dynamic> body});
  Future<void> addTutorToFavorite({required String id});
  Future<void> reportTutor({required String tutorId, required String content});
  Future<bool> becomeTutor({required BecomeTutorRequest becomeTutorRequest});
}

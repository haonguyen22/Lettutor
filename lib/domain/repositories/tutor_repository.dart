import 'package:let_tutor/domain/entities/tutor.dart';

abstract class TutorRepository {
  Future<List<Tutor>?> getTutors({int perPage = 9, required int page});
  Future<Tutor?> getTutorById({required String id});
  Future<List<Tutor>?> searchTutor({required Map<String, dynamic> body});
  Future<void> addTutorToFavorite({required String id});
}

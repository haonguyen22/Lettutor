import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/tutor/search_tutor_response.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/domain/repositories/tutor_repository.dart';

@injectable
class TutorUseCase {
  final TutorRepository _tutorRepository;

  const TutorUseCase(this._tutorRepository);

  Future<void> addTutorToFavorite({required String id}) async {
    await _tutorRepository.addTutorToFavorite(id: id);
  }

  Future<Tutor?> getTutorById({required String id}) async {
    return await _tutorRepository.getTutorById(id: id);
  }

  Future<List<Tutor>?> getTutors({int perPage = 9, required int page}) async {
    return await _tutorRepository.getTutors(page: page, perPage: perPage);
  }

  Future<SearchTutorsResponse?> searchTutor(
      {required Map<String, dynamic> body}) async {
    return await _tutorRepository.searchTutor(body: body);
  }

  Future<void> reportTutor(
      {required String tutorId, required String content}) async {
    return await _tutorRepository.reportTutor(
        tutorId: tutorId, content: content);
  }
}

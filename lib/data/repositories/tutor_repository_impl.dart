import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/tutor/tutor_service.dart';
import 'package:let_tutor/data/models/tutor/search_tutor_response.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';
import 'package:let_tutor/data/models/tutor/tutors_response.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:let_tutor/domain/repositories/tutor_repository.dart';

@Injectable(as: TutorRepository)
class TutorRepositoryImpl implements TutorRepository {
  final TutorService _tutorService;
  TutorRepositoryImpl(this._tutorService);

  @override
  Future<void> addTutorToFavorite({required String id}) async {
    try {
      await _tutorService.addTutorToFavorite(body: {"tutorId": id});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<Tutor?> getTutorById({required String id}) async {
    try {
      TutorModel? res = await _tutorService.getTutorById(id: id);
      return res?.toEntity();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<Tutor>?> getTutors({int perPage = 9, required int page}) async {
    try {
      TutorsResponse? res =
          await _tutorService.getTutors(page: page, perPage: perPage);
      return res?.tutors?.map((e) => e.toEntity()).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<Tutor>?> searchTutor({required Map<String, dynamic> body}) async {
    try {
      SearchTutorsResponse? res = await _tutorService.searchTutor(body: body);
      return res?.tutors?.map((e) => e.toEntity()).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

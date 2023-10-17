import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';
import 'package:let_tutor/domain/repositories/schedule_repository.dart';

@injectable
class ScheduleUseCase {
  final ScheduleRepository _scheduleRepository;

  const ScheduleUseCase(this._scheduleRepository);

  Future<String?> cancelBookedClass(
      {required List<String> scheduleDetailIds}) async {
    return await _scheduleRepository.cancelBookedClass(
      scheduleDetailIds: scheduleDetailIds,
    );
  }

  Future<List<ScheduleModel>?> getScheduleByTutorID(
      {required String tutorId}) async {
    return await _scheduleRepository.getScheduleByTutorID(tutorId: tutorId);
  }
}

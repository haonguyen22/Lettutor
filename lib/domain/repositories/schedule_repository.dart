import 'package:let_tutor/data/models/schedule/schedule_model.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleModel>?> getScheduleByTutorID({required String tutorId});

  Future<String?> cancelBookedClass({required List<String> scheduleDetailIds});
}

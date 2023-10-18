import 'package:let_tutor/data/models/schedule/booking_info_model.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';

abstract class ScheduleRepository {
  Future<List<ScheduleModel>?> getScheduleByTutorID({required String tutorId});

  Future<String?> cancelBookedClass({required List<String> scheduleDetailIds});

  Future<List<BookingInfoModel>?> getBookedClasses({
    required int page,
    int perPage = 10,
    String orderBy = "meeting",
    String sortBy = "desc",
  });
}

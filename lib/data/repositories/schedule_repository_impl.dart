import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/schedule/schedule_service.dart';
import 'package:let_tutor/data/models/schedule/booking_class_response.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';
import 'package:let_tutor/data/models/schedule/schedule_response.dart';
import 'package:let_tutor/data/models/schedule/upcoming_class_response.dart';
import 'package:let_tutor/domain/repositories/schedule_repository.dart';

@Injectable(as: ScheduleRepository)
class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleService _scheduleService;

  ScheduleRepositoryImpl(this._scheduleService);
  @override
  Future<String?> cancelBookedClass(
      {required List<String> scheduleDetailIds}) async {
    try {
      final res = await _scheduleService
              .cancelBookedClass(body: {"scheduleDetailIds": scheduleDetailIds})
          as Map<String, dynamic>;
      return res["message"];
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<ScheduleModel>?> getScheduleByTutorID(
      {required String tutorId}) async {
    try {
      ScheduleResponse? res =
          await _scheduleService.getScheduleByTutorID(body: {
        "tutorId": tutorId,
      });
      return res?.data;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<BookingInfoModel>?> getBookedClasses(
      {required int page,
      int perPage = 10,
      String orderBy = "meeting",
      String sortBy = "desc"}) async {
    try {
      final timeLte = DateTime.now()
          .subtract(const Duration(minutes: 35))
          .millisecondsSinceEpoch;
      BookingClassResponse? res = await _scheduleService.getBookedClass(
        page: page,
        perPage: perPage,
        dateTimeLte: timeLte,
        orderBy: orderBy,
        sortBy: sortBy,
      );
      return res?.data?.rows;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<List<BookingInfoModel>?> getUpcomingClasses() async {
    try {
      int now = DateTime.now().millisecondsSinceEpoch;
      UpcomingClassResponse? res =
          await _scheduleService.upcomingClasses(dateTime: now);
      return res?.data;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

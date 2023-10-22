import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';

part "booking_info_model.g.dart";
part "booking_info_model.freezed.dart";

@freezed
class BookingInfoModel with _$BookingInfoModel {
  const factory BookingInfoModel({
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? id,
    String? userId,
    String? scheduleDetailId,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    String? googleMeetLink,
    String? studentRequest,
    String? tutorReview,
    int? scoreByTutor,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? recordUrl,
    String? cancelReasonId,
    int? lessonPlanId,
    String? cancelNote,
    String? calendarId,
    bool? isDeleted,
    bool? isTrial,
    int? convertedLesson,
    ScheduleDetailInfoModel? scheduleDetailInfo,
  }) = _BookingInfoModel;

  factory BookingInfoModel.fromJson(Map<String, Object?> json) =>
      _$BookingInfoModelFromJson(json);
}

@freezed
class ScheduleDetailInfoModel with _$ScheduleDetailInfoModel {
  const factory ScheduleDetailInfoModel({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
    ScheduleInfoModel? scheduleInfo,
  }) = _ScheduleDetailInfoModel;
  factory ScheduleDetailInfoModel.fromJson(Map<String, Object?> json) =>
      _$ScheduleDetailInfoModelFromJson(json);
}

@freezed
class ScheduleInfoModel with _$ScheduleInfoModel {
  const factory ScheduleInfoModel({
    String? date,
    int? startTimestamp,
    int? endTimestamp,
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    TutorModel? tutorInfo,
  }) = _ScheduleInfoModel;
  factory ScheduleInfoModel.fromJson(Map<String, Object?> json) =>
      _$ScheduleInfoModelFromJson(json);
}

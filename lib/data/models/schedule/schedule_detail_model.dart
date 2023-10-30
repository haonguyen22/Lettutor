import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';

part 'schedule_detail_model.g.dart';
part 'schedule_detail_model.freezed.dart';

@freezed
class ScheduleDetailModel with _$ScheduleDetailModel {
  const factory ScheduleDetailModel({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<BookingInfoModel>? bookingInfo,
    bool? isBooked,
  }) = _ScheduleDetailModel;
  
  factory ScheduleDetailModel.fromJson(Map<String, Object?> json) =>
      _$ScheduleDetailModelFromJson(json);
}




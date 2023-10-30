import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/schedule/schedule_detail_model.dart';

part 'schedule_model.g.dart';
part 'schedule_model.freezed.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    int? startTimestamp,
    int? endTimestamp,
    DateTime? createdAt,
    bool? isBooked,
    List<ScheduleDetailModel>? scheduleDetails,
  }) = _ScheduleModel;
  
  factory ScheduleModel.fromJson(Map<String, Object?> json) =>
      _$ScheduleModelFromJson(json);

}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/schedule/schedule_model.dart';

part 'schedule_response.g.dart';
part 'schedule_response.freezed.dart';

@freezed
class ScheduleResponse with _$ScheduleResponse {
  const factory ScheduleResponse({
     String? message,
     List<ScheduleModel>? data,

  }) = _ScheduleReponse;

  factory ScheduleResponse.fromJson(Map<String, Object?> json) =>
      _$ScheduleResponseFromJson(json);

}
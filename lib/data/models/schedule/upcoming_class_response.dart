import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';

@freezed
part 'upcoming_class_response.freezed.dart';
part 'upcoming_class_response.g.dart';

@freezed
class UpcomingClassResponse with _$UpcomingClassResponse {
  const factory UpcomingClassResponse({
    String? message,
    List<BookingInfoModel>? data,
  }) = _UpcomingClassResponse;

  factory UpcomingClassResponse.fromJson(Map<String, Object?> json) =>
      _$UpcomingClassResponseFromJson(json);
}

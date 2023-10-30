import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/schedule/booking_info_model.dart';

part 'booking_class_response.g.dart';
part 'booking_class_response.freezed.dart';

@freezed
class BookingClassResponse with _$BookingClassResponse {
  const factory BookingClassResponse({
    String? message,
    DataBookingClassResponse? data,
  }) = _BookingClassResponse;

  factory BookingClassResponse.fromJson(Map<String, Object?> json) =>
      _$BookingClassResponseFromJson(json);
}

@freezed
class DataBookingClassResponse with _$DataBookingClassResponse {
  const factory DataBookingClassResponse({
    int? count,
    List<BookingInfoModel>? rows,
  }) = _DataBookingClassResponse;
  
  factory DataBookingClassResponse.fromJson(Map<String, Object?> json) =>
      _$DataBookingClassResponseFromJson(json);
}



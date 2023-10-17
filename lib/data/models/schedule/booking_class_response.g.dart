// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_class_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingClassResponse _$$_BookingClassResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BookingClassResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataBookingClassResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookingClassResponseToJson(
        _$_BookingClassResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$_DataBookingClassResponse _$$_DataBookingClassResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DataBookingClassResponse(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => BookingInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DataBookingClassResponseToJson(
        _$_DataBookingClassResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

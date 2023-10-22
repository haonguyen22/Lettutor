// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_class_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpcomingClassResponse _$$_UpcomingClassResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UpcomingClassResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BookingInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UpcomingClassResponseToJson(
        _$_UpcomingClassResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

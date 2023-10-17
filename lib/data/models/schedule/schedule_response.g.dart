// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleReponse _$$_ScheduleReponseFromJson(Map<String, dynamic> json) =>
    _$_ScheduleReponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleReponseToJson(_$_ScheduleReponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

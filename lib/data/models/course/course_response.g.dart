// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseResponse _$$_CourseResponseFromJson(Map<String, dynamic> json) =>
    _$_CourseResponse(
      messages: json['messages'] as String?,
      data: json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CourseResponseToJson(_$_CourseResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'data': instance.data,
    };

_$_DataResponse _$$_DataResponseFromJson(Map<String, dynamic> json) =>
    _$_DataResponse(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DataResponseToJson(_$_DataResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_single_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CourseSingleResponse _$$_CourseSingleResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CourseSingleResponse(
      messages: json['messages'] as String?,
      data: json['data'] == null
          ? null
          : CourseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CourseSingleResponseToJson(
        _$_CourseSingleResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'data': instance.data,
    };

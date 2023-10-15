// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicCourseModel _$$_TopicCourseModelFromJson(Map<String, dynamic> json) =>
    _$_TopicCourseModel(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      orderCourse: json['orderCourse'] as int?,
      name: json['name'] as String?,
      beforeTheClassNotes: json['beforeTheClassNotes'] as String?,
      afterTheClassNotes: json['afterTheClassNotes'] as String?,
      nameFile: json['nameFile'] as String?,
      http: json['http'] as String?,
      numberOfPages: json['numberOfPages'] as String?,
      description: json['description'] as String?,
      videoUrl: json['videoUrl'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_TopicCourseModelToJson(_$_TopicCourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'orderCourse': instance.orderCourse,
      'name': instance.name,
      'beforeTheClassNotes': instance.beforeTheClassNotes,
      'afterTheClassNotes': instance.afterTheClassNotes,
      'nameFile': instance.nameFile,
      'http': instance.http,
      'numberOfPages': instance.numberOfPages,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

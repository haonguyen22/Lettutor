// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tutor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserTutorModel _$$_UserTutorModelFromJson(Map<String, dynamic> json) =>
    _$_UserTutorModel(
      id: json['id'] as String?,
      level: json['level'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      caredByStaffId: json['caredByStaffId'] as String?,
      zaloUserId: json['zaloUserId'] as String?,
      studentGroupId: json['studentGroupId'] as String?,
      courses: json['courses'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_UserTutorModelToJson(_$_UserTutorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'language': instance.language,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'zaloUserId': instance.zaloUserId,
      'studentGroupId': instance.studentGroupId,
      'courses': instance.courses,
    };

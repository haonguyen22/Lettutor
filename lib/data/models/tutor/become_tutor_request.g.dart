// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'become_tutor_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BecomeTutorRequest _$$_BecomeTutorRequestFromJson(
        Map<String, dynamic> json) =>
    _$_BecomeTutorRequest(
      name: json['name'] as String?,
      country: json['country'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      interest: json['interest'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      languages: json['languages'] as String?,
      bio: json['bio'] as String?,
      targetStudent: json['targetStudent'] as String?,
      specialties: (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      certificates: json['certificates'] as List<dynamic>?,
      avatar: json['avatar'] as String?,
      video: json['video'],
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$_BecomeTutorRequestToJson(
        _$_BecomeTutorRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'birthDay': instance.birthDay?.toIso8601String(),
      'interest': instance.interest,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'languages': instance.languages,
      'bio': instance.bio,
      'targetStudent': instance.targetStudent,
      'specialties': instance.specialties,
      'certificates': instance.certificates,
      'avatar': instance.avatar,
      'video': instance.video,
      'price': instance.price,
    };

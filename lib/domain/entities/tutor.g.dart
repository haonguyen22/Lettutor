// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tutor _$$_TutorFromJson(Map<String, dynamic> json) => _$_Tutor(
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
      video: json['video'] as String?,
      education: json['education'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      interests: json['interests'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      targetStudent: json['targetStudent'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      totalFeedback: json['totalFeedback'] as int?,
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$$_TutorToJson(_$_Tutor instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'id': instance.id,
      'userId': instance.userId,
      'country': instance.country,
      'phone': instance.phone,
      'bio': instance.bio,
      'video': instance.video,
      'education': instance.education,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'interests': instance.interests,
      'experience': instance.experience,
      'profession': instance.profession,
      'targetStudent': instance.targetStudent,
      'rating': instance.rating,
      'price': instance.price,
      'totalFeedback': instance.totalFeedback,
      'isFavorite': instance.isFavorite,
    };

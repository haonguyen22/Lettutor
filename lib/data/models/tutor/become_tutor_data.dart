import 'dart:io';

import 'package:dio/dio.dart';

class BecomeTutorData {
  final String? name;
  final String? country;
  final DateTime? birthDay;
  final String? interests;
  final String? education;
  final String? experience;
  final String? profession;
  final List<String>? languages;
  final String? bio;
  final String? targetStudent;
  final List<String>? specialties;
  final String? avatar;
  final String? video;
  final int? price;
  const BecomeTutorData({
    this.name,
    this.country,
    this.birthDay,
    this.interests,
    this.education,
    this.experience,
    this.profession,
    this.languages,
    this.bio,
    this.targetStudent,
    this.specialties,
    this.avatar,
    this.video,
    this.price,
  });

  factory BecomeTutorData.fromJson(Map<String, dynamic> json) {
    return BecomeTutorData(
      name: json['name'],
      country: json['country'],
      birthDay: DateTime.tryParse(json['birthDay']),
      interests: json['interests'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      languages: json['languages']?.split(','),
      bio: json['bio'],
      targetStudent: json['targetStudent'],
      specialties: json['specialties']?.split(','),
      avatar: json['avatar'],
      video: json['video'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['birthDay'] = birthDay?.toIso8601String();
    data['interests'] = interests;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['languages'] = languages?.join(',');
    data['bio'] = bio;
    data['targetStudent'] = targetStudent;
    data['specialties'] = specialties?.join(',');
    data['avatar'] = avatar;
    data['video'] = video;
    data['price'] = price;
    return data;
  }

  // copyWith
  BecomeTutorData copyWith({
    String? name,
    String? country,
    DateTime? birthDay,
    String? interests,
    String? education,
    String? experience,
    String? profession,
    List<String>? languages,
    String? bio,
    String? targetStudent,
    List<String>? specialties,
    String? avatar,
    String? video,
    int? price,
  }) {
    return BecomeTutorData(
      name: name ?? this.name,
      country: country ?? this.country,
      birthDay: birthDay ?? this.birthDay,
      interests: interests ?? this.interests,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      profession: profession ?? this.profession,
      languages: languages ?? this.languages,
      bio: bio ?? this.bio,
      targetStudent: targetStudent ?? this.targetStudent,
      specialties: specialties ?? this.specialties,
      avatar: avatar ?? this.avatar,
      video: video ?? this.video,
      price: price ?? this.price,
    );
  }

  BecomeTutorData copyEntityWith(BecomeTutorData? data) {
    return BecomeTutorData(
      name: data?.name ?? name,
      country: data?.country ?? country,
      birthDay: data?.birthDay ?? birthDay,
      interests: data?.interests ?? interests,
      education: data?.education ?? education,
      experience: data?.experience ?? experience,
      profession: data?.profession ?? profession,
      languages: data?.languages ?? languages,
      bio: data?.bio ?? bio,
      targetStudent: data?.targetStudent ?? targetStudent,
      specialties: data?.specialties ?? specialties,
      avatar: data?.avatar ?? avatar,
      video: data?.video ?? video,
      price: data?.price ?? price,
    );
  }

  FormData toFormData() {
    final formData = FormData();
    formData.fields
      ..add(MapEntry('name', name ?? ""))
      ..add(MapEntry('country', country ?? ""))
      ..add(MapEntry('birthDay', birthDay?.toIso8601String() ?? ""))
      ..add(MapEntry('interests', interests ?? ""))
      ..add(MapEntry('education', education ?? ""))
      ..add(MapEntry('experience', experience ?? ""))
      ..add(MapEntry('profession', profession ?? ""))
      ..add(MapEntry('languages', languages?.join(',') ?? ""))
      ..add(MapEntry('bio', bio ?? ""))
      ..add(MapEntry('targetStudent', targetStudent ?? ""))
      ..add(MapEntry('specialties', specialties?.join(',') ?? ""))
      ..add(MapEntry('price', price.toString()));

    if (video?.isNotEmpty ?? false) {
      formData.files.add(
        MapEntry(
          'video',
          MultipartFile.fromBytes(File(video!).readAsBytesSync()),
        ),
      );
    }

    if (avatar?.isNotEmpty ?? false) {
      formData.files.add(MapEntry(
        'avatar',
        MultipartFile.fromBytes(File(avatar!).readAsBytesSync()),
      ));
    }
    return formData;
  }
}

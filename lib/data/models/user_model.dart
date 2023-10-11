import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/topic_model.dart';
import 'package:let_tutor/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required String avatar,
    required String country,
    required String phone,
    required String language,
    required DateTime birthday,
    required String requireNote,
    required String level,
    required List<TopicModel> learnTopics,
    required List<TopicModel> testPreparations,
    required String studySchedule,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      avatar: avatar,
      country: country,
      phone: phone,
      language: language,
      birthday: birthday,
      requireNote: requireNote,
      level: level,
      learnTopics: learnTopics.map((e) => e.toEntity()).toList(),
      testPreparations: testPreparations.map((e) => e.toEntity()).toList(),
      studySchedule: studySchedule,
    );
  }
}

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
    String? avatar,
    String? country,
    String? phone,
    String? language,
    DateTime? birthday,
    String? requireNote,
    String? level,
    List<TopicModel>? learnTopics,
    List<TopicModel>? testPreparations,
    String? studySchedule,
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
      learnTopics: learnTopics?.map((e) => e.toEntity()).toList(),
      testPreparations: testPreparations?.map((e) => e.toEntity()).toList(),
      studySchedule: studySchedule,
    );
  }
}

@freezed
class EditUserResponse with _$EditUserResponse {
  const EditUserResponse._();

  const factory EditUserResponse({
    required UserModel user,
  }) = _EditUserResponse;

  factory EditUserResponse.fromJson(Map<String, Object?> json) =>
      _$EditUserResponseFromJson(json);
}

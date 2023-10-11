import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/domain/entities/topic.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
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
    required List<Topic> learnTopics,
    required List<Topic> testPreparations,
    required String studySchedule,
  }) = _User;
}

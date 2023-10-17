import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/domain/entities/topic.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    String? language,
    DateTime? birthday,
    String? requireNote,
    String? level,
    List<Topic>? learnTopics,
    List<Topic>? testPreparations,
    String? studySchedule,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

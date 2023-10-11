import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/domain/entities/topic.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
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
    List<Topic>? learnTopics,
    List<Topic>? testPreparations,
    String? studySchedule,
  }) = _User;
}

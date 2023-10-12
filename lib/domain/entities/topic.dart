import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    required final int id,
    required final String key,
    required final String name,
  }) = _Topic;

  factory Topic.fromJson(Map<String, Object?> json) =>
      _$TopicFromJson(json);
}

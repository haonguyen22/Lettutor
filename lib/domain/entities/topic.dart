import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic.freezed.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    required int id,
    required String key,
    required String name,
  }) = _Topic;
}

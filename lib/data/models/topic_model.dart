import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/domain/entities/topic.dart';
part 'topic_model.freezed.dart';
part 'topic_model.g.dart';

@freezed
class TopicModel with _$TopicModel {
  const TopicModel._();

  const factory TopicModel({
    required int id,
    required String key,
    required String name,
  }) = _TopicModel;

  factory TopicModel.fromJson(Map<String, Object?> json) =>
      _$TopicModelFromJson(json);

  Topic toEntity() {
    return Topic(
      id: id,
      key: key,
      name: name,
    );
  }
}

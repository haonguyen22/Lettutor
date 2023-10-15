import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic_course_model.freezed.dart';
part 'topic_course_model.g.dart';
@freezed
class TopicCourseModel with _$TopicCourseModel {
  const TopicCourseModel._();
  const factory TopicCourseModel({
    String? id,
    String? courseId,
    int? orderCourse,
    String? name,
    String? beforeTheClassNotes,
    String? afterTheClassNotes,
    String? nameFile,
    String? http,
    String? numberOfPages,
    String? description,
    String? videoUrl,
    String? type,
    String? createdAt,
    String? updatedAt,
  }) = _TopicCourseModel;

  factory TopicCourseModel.fromJson(Map<String, dynamic> json)=> _$TopicCourseModelFromJson(json);
}

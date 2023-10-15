import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/course/topic_course_model.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? http,
    String? level,
    String? reason,
    String? purpose,
    String? otherDetails,
    int? defaultPrice,
    int? coursePrice,
    String? courseType,
    String? sectionType,
    bool? visible,
    String? displayOrder,
    String? createdAt,
    String? updatedAt,
    List<TopicCourseModel>? topics,
  }) = _Course;

  factory Course.fromJson(Map<String, Object?> json) => _$CourseFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/course/topic_course_model.dart';
import 'package:let_tutor/domain/entities/course.dart';
part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel with _$CourseModel {
  const CourseModel._();

  const factory CourseModel({
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
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, Object?> json) =>
      _$CourseModelFromJson(json);

  Course toEntity() => Course(
        id: id,
        name: name,
        description: description,
        imageUrl: imageUrl,
        http: http,
        level: level,
        reason: reason,
        purpose: purpose,
        otherDetails: otherDetails,
        defaultPrice: defaultPrice,
        coursePrice: coursePrice,
        courseType: courseType,
        sectionType: sectionType,
        visible: visible,
        displayOrder: displayOrder,
        createdAt: createdAt,
        updatedAt: updatedAt,
        topics: topics,
      );
}

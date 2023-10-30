import 'package:freezed_annotation/freezed_annotation.dart';

import 'course_model.dart';

part 'course_single_response.g.dart';
part 'course_single_response.freezed.dart';

@freezed
class CourseSingleResponse with _$CourseSingleResponse {
  const CourseSingleResponse._();
  const factory CourseSingleResponse({
    String? messages,
    CourseModel? data,
  }) = _CourseSingleResponse;

  factory CourseSingleResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseSingleResponseFromJson(json);
}

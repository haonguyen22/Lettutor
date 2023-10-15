import 'package:freezed_annotation/freezed_annotation.dart';

import 'course_model.dart';

part 'course_response.g.dart';
part 'course_response.freezed.dart';

@freezed
class CourseResponse with _$CourseResponse {
  const CourseResponse._();
  const factory CourseResponse({
    String? messages,
    DataResponse? data,
  }) = _CourseResponse;

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);
}

@freezed
class DataResponse with _$DataResponse {
  const factory DataResponse({
    int? count,
    List<CourseModel>? rows,
  }) = _DataResponse;

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
}

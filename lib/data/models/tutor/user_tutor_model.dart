import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tutor_model.freezed.dart';
part 'user_tutor_model.g.dart';

@freezed
class UserTutorModel with _$UserTutorModel {
  const factory UserTutorModel({
    String? id,
    String? level,
    String? avatar,
    String? name,
    String? country,
    String? language,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    String? studentGroupId,
    List? courses,
  }) = _UserTutorModel;

  factory UserTutorModel.fromJson(Map<String, Object?> json) =>
      _$UserTutorModelFromJson(json);
}

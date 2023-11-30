import 'package:freezed_annotation/freezed_annotation.dart';

part 'become_tutor_request.freezed.dart';
part 'become_tutor_request.g.dart';

@freezed
class BecomeTutorData with _$BecomeTutorData {
  const factory BecomeTutorData({
    String? name,
    String? country,
    DateTime? birthDay,
    String? interest,
    String? education,
    String? experience,
    String? profession,
    String? languages,
    String? bio,
    String? targetStudent,
    List<String>? specialties,
    List<dynamic>? certificates,
    String? avatar,
    dynamic video,
    int? price,
  }) = _BecomeTutorRequest;

  factory BecomeTutorData.fromJson(Map<String, dynamic> json) =>
      _$BecomeTutorRequestFromJson(json);
}

BecomeTutorData mergeBecomeTutorData(
  BecomeTutorData? old,
  BecomeTutorData? newRequest,
) {
  return BecomeTutorData(
    name: newRequest?.name ?? old?.name,
    country: newRequest?.country ?? old?.country,
    birthDay: newRequest?.birthDay ?? old?.birthDay,
    interest: newRequest?.interest ?? old?.interest,
    education: newRequest?.education ?? old?.education,
    experience: newRequest?.experience ?? old?.experience,
    profession: newRequest?.profession ?? old?.profession,
    languages: newRequest?.languages ?? old?.languages,
    bio: newRequest?.bio ?? old?.bio,
    targetStudent: newRequest?.targetStudent ?? old?.targetStudent,
    specialties: newRequest?.specialties ?? old?.specialties,
    avatar: newRequest?.avatar ?? old?.avatar,
    price: newRequest?.price ?? old?.price,
    certificates: newRequest?.certificates ?? old?.certificates,
    video: newRequest?.video ?? old?.video,
  );
}

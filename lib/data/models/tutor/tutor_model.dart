import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
part 'tutor_model.freezed.dart';
part 'tutor_model.g.dart';

@freezed
class TutorModel with _$TutorModel {
  const TutorModel._();

  const factory TutorModel({
    @JsonKey(name: 'avatar') String? imageUrl,
    String? name,
    String? id,
    String? userId,
    String? country,
    String? phone,
    String? bio,
    String? video,
    String? education,
    String? languages,
    String? specialties,
    String? interests,
    String? experience,
    String? profession,
    String? targetStudent,
    double? rating,
    double? price,
    int? totalFeedback,
    bool? isFavorite,
  }) = _TutorModel;

  factory TutorModel.fromJson(Map<String, Object?> json) =>
      _$TutorModelFromJson(json);

  Tutor toEntity() {
    return Tutor(
      bio: bio,
      country: country,
      education: education,
      experience: experience,
      id: id,
      imageUrl: imageUrl,
      interests: interests,
      isFavorite: isFavorite,
      languages: languages,
      name: name,
      phone: phone,
      price: price,
      profession: profession,
      rating: rating,
      specialties: specialties,
      targetStudent: targetStudent,
      totalFeedback: totalFeedback,
      userId: userId,
      video: video,
    );
  }
}

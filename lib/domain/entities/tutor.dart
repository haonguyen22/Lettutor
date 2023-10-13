import 'package:freezed_annotation/freezed_annotation.dart';
part 'tutor.freezed.dart';
part 'tutor.g.dart';

@freezed
class Tutor with _$Tutor {
  const factory Tutor({
    String? imageUrl,
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
  }) = _Tutor;

  factory Tutor.fromJson(Map<String, Object?> json) => _$TutorFromJson(json);
}

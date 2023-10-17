import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/tutor/feedback_model.dart';
import 'package:let_tutor/data/models/tutor/user_tutor_model.dart';
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
    UserTutorModel? user,
    List<FeedBackModel>? feedbacks,
  }) = _Tutor;

  factory Tutor.fromJson(Map<String, Object?> json) => _$TutorFromJson(json);
}

Tutor mergeTutors(Tutor? tutor1, Tutor? tutor2) {
  return Tutor(
    imageUrl: tutor2?.imageUrl ?? tutor1?.imageUrl,
    name: tutor2?.name ?? tutor1?.name,
    id: tutor2?.id ?? tutor1?.id,
    userId: tutor2?.userId ?? tutor1?.userId,
    country: tutor2?.country ?? tutor1?.country,
    phone: tutor2?.phone ?? tutor1?.phone,
    bio: tutor2?.bio ?? tutor1?.bio,
    video: tutor2?.video ?? tutor1?.video,
    education: tutor2?.education ?? tutor1?.education,
    languages: tutor2?.languages ?? tutor1?.languages,
    specialties: tutor2?.specialties ?? tutor1?.specialties,
    interests: tutor2?.interests ?? tutor1?.interests,
    experience: tutor2?.experience ?? tutor1?.experience,
    profession: tutor2?.profession ?? tutor1?.profession,
    targetStudent: tutor2?.targetStudent ?? tutor1?.targetStudent,
    rating: tutor2?.rating ?? tutor1?.rating,
    price: tutor2?.price ?? tutor1?.price,
    totalFeedback: tutor2?.totalFeedback ?? tutor1?.totalFeedback,
    isFavorite: tutor2?.isFavorite ?? tutor1?.isFavorite,
    user: tutor2?.user ?? tutor1?.user,
    feedbacks: tutor2?.feedbacks ?? tutor1?.feedbacks,
  );
}

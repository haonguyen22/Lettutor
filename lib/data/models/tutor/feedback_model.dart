import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/user_model.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedBackModel with _$FeedBackModel {
  const factory FeedBackModel({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    int? rating,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    @JsonKey(name: "firstInfo") UserModel? info,
  }) = _FeedBackModel;

  factory FeedBackModel.fromJson(Map<String, Object?> json) =>
      _$FeedBackModelFromJson(json);
}

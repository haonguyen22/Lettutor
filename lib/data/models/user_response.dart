// freezed with user_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:let_tutor/data/models/user_model.dart';

part 'user_response.g.dart';
part 'user_response.freezed.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    UserModel? user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, Object?> json) =>
      _$UserResponseFromJson(json);
}
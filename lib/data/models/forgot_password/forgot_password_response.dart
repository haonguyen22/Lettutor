import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_response.freezed.dart';
part 'forgot_password_response.g.dart';

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({
    @Default(200) int statusCode,
    required String message,
    int? internalCode,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

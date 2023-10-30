import 'package:let_tutor/data/models/token/token.dart';
import 'package:let_tutor/data/models/user_model.dart';

class AuthResponse {
  final UserModel user;
  final Token token;
  AuthResponse(this.user, this.token);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        UserModel.fromJson(json['user'] as Map<String, dynamic>),
        Token.fromJson(json['tokens'] as Map<String, dynamic>),
      );
}

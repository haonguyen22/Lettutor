import 'package:let_tutor/data/models/token/token.dart';

class SignInResponse {
  final Token token;
  SignInResponse(this.token);

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      SignInResponse(Token.fromJson(json['tokens'] as Map<String, dynamic>));
}

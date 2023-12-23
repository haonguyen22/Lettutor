import 'package:let_tutor/data/models/forgot_password/forgot_password_response.dart';
import 'package:let_tutor/data/models/token/sign_in_model.dart';

abstract class AuthRepository {
  Future<AuthResponse?> login(
      {required String email, required String password});

  Future<AuthResponse?> register(
      {required String email, required String password});

  Future<ForgotPasswordResponse> resetPassword({required String email});

  Future<AuthResponse?> loginByGoogle({required String token});
}

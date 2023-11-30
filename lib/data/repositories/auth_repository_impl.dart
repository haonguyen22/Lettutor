import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/auth/auth_service.dart';
import 'package:let_tutor/data/models/forgot_password/forgot_password_response.dart';
import 'package:let_tutor/data/models/token/sign_in_model.dart';
import 'package:let_tutor/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  const AuthRepositoryImpl(this._authService);
  @override
  Future<AuthResponse?> login(
      {required String email, required String password}) async {
    try {
      final res = await _authService.login(body: {
        "email": email,
        "password": password,
      });
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthResponse?> register(
      {required String email, required String password}) async {
    try {
      final res = await _authService.register(body: {
        "email": email,
        "password": password,
      });
      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ForgotPasswordResponse> resetPassword({required String email}) async {
    try {
      final res = await _authService.forgotPassword(body: {"email": email});
      return ForgotPasswordResponse(
        message: res.message,
        statusCode: res.statusCode,
      );
    } catch (e) {
      // log error
      return ForgotPasswordResponse(
        message: e.toString(),
        statusCode: 400,
      );
    }
  }
}

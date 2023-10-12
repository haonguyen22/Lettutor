import 'package:let_tutor/data/models/token/sign_in_model.dart';

abstract class AuthRepository {
  Future<AuthResponse?> login(
      {required String email, required String password});

  Future<AuthResponse?> register(
      {required String email, required String password});

  Future<bool?> resetPassword({required String email});
}

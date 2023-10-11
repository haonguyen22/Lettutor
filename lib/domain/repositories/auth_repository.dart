import 'package:let_tutor/data/models/token/token.dart';
import 'package:let_tutor/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Token?> login({required String email, required String password});

  Future<User?> register({required String email, required String password});

  Future<bool?> resetPassword({required String email});
}

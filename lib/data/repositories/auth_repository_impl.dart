import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/auth/auth_service.dart';
import 'package:let_tutor/data/models/token/token.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  const AuthRepositoryImpl(this._authService);
  @override
  Future<Token?> login(
      {required String email, required String password}) async {
    try {
      final res = await _authService.login(body: {
        "email": email,
        "password": password,
      });
      return res?.token;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> register({required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool?> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}

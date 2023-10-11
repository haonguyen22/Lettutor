import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/auth/auth_service.dart';
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
  Future<bool?> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}

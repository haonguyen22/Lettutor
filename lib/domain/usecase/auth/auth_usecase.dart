import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/local/preference.dart';
import 'package:let_tutor/data/models/token/token.dart';
import 'package:let_tutor/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;
  final SharedPreferences _sharedPreferences;

  const AuthUseCase(this._authRepository, this._sharedPreferences);

  Future<Token?> login({
    required String email,
    required String password,
  }) async {
    final token = await _authRepository.login(email: email, password: password);
    if (token != null) {
      _sharedPreferences.setString(Preference.accessToken, token.access.token);
      _sharedPreferences.setString(
          Preference.refreshToken, token.refresh.token);
      _sharedPreferences.setInt(
          Preference.expireTime, token.refresh.expires.millisecondsSinceEpoch);
    }
    return token;
  }

  void logout() {
    _sharedPreferences.remove(Preference.accessToken);
    _sharedPreferences.remove(Preference.expireTime);
    _sharedPreferences.remove(Preference.refreshToken);
  }
}

import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/local/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLangDefault = 'en';
const _kThemeModeDefault = 'light';

@Singleton()
class SharedPreferencesUseCase {
  @factoryMethod
  const SharedPreferencesUseCase(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<bool> setLanguage(String language) =>
      _sharedPreferences.setString(Preference.lang, language);

  String getLanguage() {
    return _sharedPreferences.getString(Preference.lang) ?? _kLangDefault;
  }

  Future<bool> setAppearance(String mode) =>
      _sharedPreferences.setString(Preference.appearance, mode);

  String getAppearance() {
    return _sharedPreferences.getString(Preference.appearance) ??
        _kThemeModeDefault;
  }

  Future<bool> setAccessToken(String token) =>
      _sharedPreferences.setString(Preference.accessToken, token);

  String getAccessToken() {
    return _sharedPreferences.getString(Preference.accessToken) ?? "";
  }

  Future<bool> setRefreshToken(String token) =>
      _sharedPreferences.setString(Preference.refreshToken, token);


  Future<bool> setExpired(String token) =>
      _sharedPreferences.setString(Preference.refreshToken, token);

  String getRefreshToken() {
    return _sharedPreferences.getString(Preference.refreshToken) ?? "";
  }

  Future<bool> setExpireTime(int time) =>
      _sharedPreferences.setInt(Preference.expireTime, time);

  int getExpireTime() {
    return _sharedPreferences.getInt(Preference.expireTime) ?? 0;
  }
}

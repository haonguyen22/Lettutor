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
}

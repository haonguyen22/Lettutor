import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLangDefault = 'en';
const _kThemeModeDefault = 'light';

@Singleton()
class SharedPreferencesUseCase {
  @factoryMethod
  const SharedPreferencesUseCase(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<bool> setLanguage(String language) =>
      _sharedPreferences.setString('lang', language);

  String getLanguage() {
    return _sharedPreferences.getString('lang') ?? _kLangDefault;
  }

  Future<bool> setAppearance(String mode) =>
      _sharedPreferences.setString('appearance', mode);

  String getAppearance() {
    return _sharedPreferences.getString('appearance') ?? _kThemeModeDefault;
  }
}

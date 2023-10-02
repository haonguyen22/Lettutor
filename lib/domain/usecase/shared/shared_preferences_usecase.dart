import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLangDefault = 'en';

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
}

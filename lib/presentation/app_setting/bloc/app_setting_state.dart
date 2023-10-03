part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {
  final String langCode;

  const AppSettingState(
    this.langCode,
  );

  get languageCode => null;

  String get langIcon {
    switch (langCode) {
      case 'vi':
        return 'assets/icons/vi.png';
      default:
        return 'assets/icons/en.png';
    }
  }
}

class AppSettingInitial extends AppSettingState {
  const AppSettingInitial(super.languageCode);
}

class SaveLanguageSuccess extends AppSettingInitial {
  const SaveLanguageSuccess(super.languageCode);
}

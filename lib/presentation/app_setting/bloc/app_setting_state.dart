part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {
  final String langCode;

  const AppSettingState(this.langCode);

  get languageCode => null;
}

class AppSettingInitial extends AppSettingState {
  const AppSettingInitial(super.languageCode);
}

class SaveLanguageSuccess extends AppSettingInitial {
  const SaveLanguageSuccess(super.languageCode);
}

part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingEvent {}

class SaveLanguageEvent extends AppSettingEvent {}

class SaveAppearanceEvent extends AppSettingEvent {}

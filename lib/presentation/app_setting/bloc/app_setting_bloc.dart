import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/usecase/shared_preferences_usecase.dart';
import 'package:meta/meta.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

@injectable
class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final SharedPreferencesUseCase sharedPreferencesUseCase;

  AppSettingBloc(this.sharedPreferencesUseCase)
      : super(AppSettingInitial(
          sharedPreferencesUseCase.getLanguage(),
          sharedPreferencesUseCase.getAppearance().convertToAppearance(),
        )) {
    on<SaveLanguageEvent>(mapSaveLanguageEvent);
    on<SaveAppearanceEvent>(mapSaveAppearanceEvent);
  }

  FutureOr<void> mapSaveLanguageEvent(
      SaveLanguageEvent event, Emitter<AppSettingState> emit) async {
    var newLangCode = 'en'; // Default
    if (state.langCode == 'en') {
      newLangCode = 'vi';
    }

    final isSave = await sharedPreferencesUseCase.setLanguage(newLangCode);
    if (isSave) {
      emit(SaveSuccess(newLangCode, state.appearance));
    }
  }

  FutureOr<void> mapSaveAppearanceEvent(
      SaveAppearanceEvent event, Emitter<AppSettingState> emit) async {
    var newModeTheme = Appearance.light;
    if (state.appearance.isLight) {
      newModeTheme = Appearance.dark;
    }

    final isSave =
        await sharedPreferencesUseCase.setAppearance(newModeTheme.name);
    if (isSave) {
      emit(SaveSuccess(state.langCode, newModeTheme));
    }
  }
}

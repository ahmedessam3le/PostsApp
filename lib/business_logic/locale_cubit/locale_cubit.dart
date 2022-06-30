import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleStates> {
  // final GetSavedLanguageUseCase getSavedLanguageUseCase;
  // final ChangeLanguageUseCase changeLanguageUseCase;
  LocaleCubit(
      // required this.getSavedLanguageUseCase,
      // required this.changeLanguageUseCase,
      )
      : super(ChangeLocalState(Locale(AppStrings.englishCode)));

  String currentLanguageCode = AppStrings.englishCode;

  Future<void> getSavedLanguage() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    currentLanguageCode = sharedPreferences.getString(AppStrings.locale) ??
        AppStrings.englishCode;
    emit(ChangeLocalState(Locale(currentLanguageCode)));
    // return sharedPreferences.getString(AppStrings.locale) ??
    //     AppStrings.englishCode;
  }

  Future<void> _changeLanguage(String languageCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(AppStrings.locale, languageCode);
    currentLanguageCode = languageCode;
    emit(ChangeLocalState(Locale(currentLanguageCode)));
  }

  void toEnglish() => _changeLanguage(AppStrings.englishCode);
  void toArabic() => _changeLanguage(AppStrings.arabicCode);
}

import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:arb_translation/arb_translation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../extension/arb_translation_extension.dart';

const Locale defaultLocale = Locale('fr', 'FR');

class LocalePickerCubit extends Cubit<Locale> {
  final List<Locale> _supportedLocales = TranslationLanguage.values
      .map((lang) => lang.toLocale)
      .toList();

  LocalePickerCubit() : super(defaultLocale) {
    _loadInitialLocale();
  }

  Future<void> _loadInitialLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode =
        prefs.getString('language_code') ?? defaultLocale.languageCode;
    final countryCode =
        prefs.getString('country_code') ?? defaultLocale.countryCode;

    emit(Locale(languageCode, countryCode));
  }

  Future<void> setLocale(Locale locale) async {
    if (!_supportedLocales.contains(locale)) return;

    emit(locale);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    await prefs.setString('country_code', locale.countryCode ?? '');
  }

  Future<void> clearLocale() async {
    emit(defaultLocale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('language_code');
    await prefs.remove('country_code');
  }
}

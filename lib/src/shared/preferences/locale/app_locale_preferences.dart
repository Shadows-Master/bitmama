import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_locale_preferences.g.dart';

class AppLocalePreferences {
  static AppLocalePreferences? _instance;
  static SharedPreferences? _prefs;

  factory AppLocalePreferences() {
    if (_instance == null) {
      throw Exception('AppLocalePreferences is not initialized. '
          'Please call AppLocalePreferences.ensureInitialized before.');
    }
    return _instance!;
  }

  const AppLocalePreferences._();

  static ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
    _instance ??= const AppLocalePreferences._();
  }

  static const _localeKey = 'locale';

  Locale locale() {
    final localeValue = _prefs!.getString(_localeKey);
    if (localeValue == null) return const Locale('en');

    return Locale(localeValue);
  }

  Future<void> updateLocale(Locale locale) async {
    await _prefs!.setString(_localeKey, locale.languageCode);
  }
}

@Riverpod(keepAlive: true)
AppLocalePreferences appLocalePreferences(AppLocalePreferencesRef ref) {
  return AppLocalePreferences();
}

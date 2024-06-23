import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemePreferences {
  static AppThemePreferences? _instance;
  static SharedPreferences? _prefs;

  factory AppThemePreferences() {
    if (_instance == null) {
      throw Exception('AppThemePreferences is not initialized. '
          'Please call AppThemePreferences.ensureInitialized before.');
    }
    return _instance!;
  }

  const AppThemePreferences._();

  static ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
    _instance ??= const AppThemePreferences._();
  }

  static const _themeKey = 'theme';

  ThemeMode themeMode() {
    final themeValue = _prefs!.getInt(_themeKey);
    if (themeValue == null) return ThemeMode.system;

    return ThemeMode.values[themeValue];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    await _prefs!.setInt(_themeKey, theme.index);
  }
}

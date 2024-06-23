import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../preferences/theme/app_theme_preferences.dart';

part 'app_theme_state.g.dart';

@riverpod
class AppThemeState extends _$AppThemeState {
  @override
  ThemeMode build() {
    return AppThemePreferences().themeMode();
  }

  ThemeMode getTheme() {
    return state;
  }

  void setTheme() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
    AppThemePreferences().updateThemeMode(state);
  }
}

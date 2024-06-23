import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/theme/app_theme_state.dart';

class AppStatusBar {
  setColor({BuildContext? context, required WidgetRef ref}) {
    final themeMode = ref.watch(appThemeStateProvider);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness:
            themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}

final AppStatusBar appStatusBar = AppStatusBar();

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../generated/fonts.gen.dart';
import '../../shared/constants/app_colors_scheme.dart';
import '../../shared/constants/app_dimens.dart';
import 'app_input_theme.dart';
import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData _theme({required Brightness brightness}) {
    final ColorScheme colorScheme = brightness == Brightness.light
        ? AppColorsScheme.lightColorScheme
        : AppColorsScheme.darkColorScheme;

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
      textTheme: _textTheme(colorScheme: colorScheme).apply(
        fontFamily: FontFamily.euclid,
      ),
    ).copyWith(
      scaffoldBackgroundColor: colorScheme.surfaceTint,
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
            _textTheme(colorScheme: colorScheme).headlineMedium),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        toolbarHeight: AppDimens.smContainerSize * 1.2,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
          statusBarColor: Colors.transparent,
        ),
      ),
      inputDecorationTheme: AppInputTheme.inputDecorationTheme(
        colorScheme: colorScheme,
      ),
    );
  }

  static TextTheme _textTheme({required ColorScheme colorScheme}) {
    return AppTextTheme.textTheme(colorScheme: colorScheme);
  }

  static final ThemeData lightTheme = _theme(brightness: Brightness.light);
  static final ThemeData darkTheme = _theme(brightness: Brightness.dark);
}

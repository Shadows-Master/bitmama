import 'package:flutter/material.dart';

import '../../../generated/fonts.gen.dart';
import '../../shared/constants/app_dimens.dart';

class AppTextTheme {
  AppTextTheme._();

  static textTheme({required ColorScheme colorScheme}) => TextTheme(
        displayLarge: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h0,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h1,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h2,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h3,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h4,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h5,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          fontFamily: FontFamily.euclid,
          fontSize: AppDimens.h6,
          color: colorScheme.tertiary,
          letterSpacing: .6,
          height: 1.7,
          fontWeight: FontWeight.w700,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../constants/app_colors_scheme.dart';

class AppConstants{
  AppConstants._();
  static ColorScheme appColors = AppColorsScheme.lightColorScheme;

  static String dateAgo = Jiffy.now().MEd;
  //static String dateAgo = Jiffy.parseFromDateTime(DateTime(2024, 10, 20)).fromNow();

}

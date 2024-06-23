import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension AppContextExtension on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>  showSnackBar(snackBar) => ScaffoldMessenger.of(this).showSnackBar(snackBar);

  back<T>([T? result]) => GoRouter.of(this).pop(result);
    //TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}

extension MediaQueryX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}

extension BoxShadowOf on BuildContext{
  List<BoxShadow> get boxShadow => [
     BoxShadow(
      offset: const Offset(.15, .15),
      blurRadius: .35,
      spreadRadius: .2,
      color: colorScheme.secondary.withOpacity(.2),
    )
  ];
}

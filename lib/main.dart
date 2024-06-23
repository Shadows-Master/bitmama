import 'dart:developer';
import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/core/application.dart';
import 'package:bitmama/src/shared/components/app_alert_dialog.dart';
import 'package:bitmama/src/shared/components/initializerAppWidget/app_initializer_widget.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Register error handlers. For more info, see:
  registerErrorHandlers();
  // * Entry point of the app
  runApp(
    ProviderScope(
      child: AppInitializerWidget(
        onLoaded: (context) => const Application(),
      ),
    ),
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    log(details.exceptionAsString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Material(
          elevation: 25.0,
          borderRadius: BorderRadius.circular(
            AppDimens.borderRadius,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            height: 250,
            child: AppAlertDialog.error(
              message: (details.exception.toString().contains("timeout"))
                  ? "Oops! check your internet connexion and reload"
                  : details.exceptionAsString(),
            ),
          ).alignAtCenter(),
        ).paddingSymmetric(horizontal: AppDimens.doubleSpacing),
      ),
    ).toCenter();
  };
}

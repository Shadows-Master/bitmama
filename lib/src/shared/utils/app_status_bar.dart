import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AppStatusBar {
  setColor({BuildContext? context, required WidgetRef ref}) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness:Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:Brightness.dark,
      ),
    );
  }
}

final  appStatusBar = Provider((ref) => AppStatusBar());
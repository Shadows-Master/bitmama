import 'package:bitmama/src/core/routing/app_router.dart';
import 'package:bitmama/src/core/theme/app_theme.dart';
import 'package:bitmama/src/shared/utils/app_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Application extends ConsumerWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    //final themeMode = ref.watch(appThemeStateProvider);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    ref.watch(appStatusBar).setColor(
          ref: ref,
          context: context,
        );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      //themeMode: themeMode,
      themeMode: ThemeMode.light,
    );
  }
}

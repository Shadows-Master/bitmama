import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/initializerApp/app_initializer.dart';
import '../../../core/theme/app_theme.dart';
import '../../constants/app_dimens.dart';
import '../app_alert_dialog.dart';
import '../buttons/app_button.dart';

class AppInitializerErrorWidget extends ConsumerWidget {
  const AppInitializerErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInitializerState = ref.watch(appInitializerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              elevation: 25.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimens.borderRadius,
                ),
              ),
              child: AppAlertDialog.error(
                message: (message.contains("timeout"))
                    ? "Oops! check your internet connexion and reload"
                    : message,
              ),
            ).paddingSymmetric(horizontal: AppDimens.padding),
            AppDimens.tripleSpacing.heightBox,
            AppButton(
              icon: Iconsax.refresh,
              isLoading: appInitializerState.isLoading,
              title: "Retry",
              onPressed: appInitializerState.isLoading ? null : onRetry,
            )
          ],
        ).toCenter(),
      ),
    );
  }
}

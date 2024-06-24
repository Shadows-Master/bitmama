import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../constants/app_dimens.dart';
import 'app_title.dart';

enum _AppAlertType { success, error, info }

class AppAlertDialog extends StatelessWidget {
  final String message;
  final _AppAlertType _appAlertType;
  final VoidCallback? onPressed;

  const AppAlertDialog({
    super.key,
    required this.message,
    this.onPressed,
  }) : _appAlertType = _AppAlertType.info;

  const AppAlertDialog.error({
    super.key,
    required this.message,
    this.onPressed,
  }) : _appAlertType = _AppAlertType.error;

  const AppAlertDialog.success({
    super.key,
    required this.message,
    this.onPressed,
  }) : _appAlertType = _AppAlertType.success;

  @override
  Widget build(BuildContext context) {
    late Widget alertIcon;
    //late String title;
    late String description;
    switch (_appAlertType) {
      case _AppAlertType.success:
        alertIcon = Assets.icons.check.svg();
        //title = "Success";
        description = message;
        break;
      case _AppAlertType.error:
        alertIcon = Assets.icons.arrowUpRight.svg();
        //title = "Error";
        description = message;
        break;
      case _AppAlertType.info:
        alertIcon = Assets.icons.alert.svg();
        //title = "Information";
        description = message;
        break;
    }
    return Material(
      elevation: 25.0,
      borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            alertIcon,
            AppTitle.h5(
              title: description,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../constants/app_dimens.dart';
import 'app_title.dart';
import 'buttons/app_button.dart';

enum _AppAlertType { success, error, info }

class AppAlertDialog extends StatelessWidget {
  final String message;
  final _AppAlertType _appAlertType;
  final VoidCallback? onPressed;
  final List<Widget>? actions;

  const AppAlertDialog({
    super.key,
    required this.message,
    this.onPressed,
    this.actions,
  }) : _appAlertType = _AppAlertType.info;

  const AppAlertDialog.error({
    super.key,
    required this.message,
    this.onPressed,
    this.actions,
  }) : _appAlertType = _AppAlertType.error;

  const AppAlertDialog.success({
    super.key,
    required this.message,
    this.onPressed,
    this.actions,
  }) : _appAlertType = _AppAlertType.success;

  @override
  Widget build(BuildContext context) {
    late Widget alertIcon;
    //late String title;
    late String description;
    switch (_appAlertType) {
      case _AppAlertType.success:
        alertIcon = AppRoundedIcon(
          iconImage: Assets.icons.check.svg(),
          hasBorder: false,
          size: AppDimens.tripleSpacing * 4,
        );
        //title = "Success";
        description = message;
        break;
      case _AppAlertType.error:
        alertIcon = Assets.icons.alert.svg();
        //title = "Error";
        description = message;
        break;
      case _AppAlertType.info:
        alertIcon = Assets.icons.alert.svg();
        //title = "Information";
        description = message;
        break;
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          AppDimens.padding.heightBox,
          alertIcon,
          AppDimens.padding.heightBox,
          AppTitle(
            title: description,
            textAlign: TextAlign.center,
            maxLines: 3,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
      actions: actions ?? <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: AppButton(
              onPressed: () {
                context.pop();
              },
              title: 'Close',
            ),
          ),
        ),
      ],
    );
  }
}

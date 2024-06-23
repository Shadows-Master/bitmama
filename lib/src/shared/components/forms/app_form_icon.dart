import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';

import '../../constants/app_dimens.dart';
import '../app_title.dart';

class AppFormIcon extends StatelessWidget {
  const AppFormIcon({
    super.key,
    this.icon,
    this.isRight = true,
    this.text,
  });

  final Widget? icon;
  final bool isRight;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: !isRight
              ? BorderSide(
                  width: .7,
                  color: context.colorScheme.secondary,
                )
              : BorderSide.none,
          right: isRight
              ? BorderSide(
                  width: .6,
                  color: context.colorScheme.secondary,
                )
              : BorderSide.none,
        ),
      ),
      child: icon?.paddingOnly(
            right: isRight ? AppDimens.spacing : 0,
            left: !isRight ? AppDimens.spacing : 0,
          ) ??
          AppTitle(title: text ?? "").paddingOnly(
            right: AppDimens.spacing,
          ),
    ).paddingSymmetric(
      horizontal: AppDimens.padding,
      vertical: AppDimens.padding,
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/constants/app_dimens.dart';

class AppTitleIcon extends StatelessWidget {
  const AppTitleIcon({
    super.key,
    this.color,
    this.icon,
    this.mainAxisAlignment,
    this.title,
    this.fontWeight,
  });

  final Color? color;
  final SvgPicture? icon;
  final MainAxisAlignment? mainAxisAlignment;
  final String? title;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        AppTitle.h2(
          title: title ?? AppString.balanceInfo,
          fontWeight: fontWeight ?? FontWeight.w200,
          color: color ?? colorScheme.outline,
        ),
        AppDimens.spacing.widthBox,
        icon ?? Assets.icons.eye.svg(),
      ],
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/assets.gen.dart';
import '../constants/app_dimens.dart';

class AppRoundedIcon extends StatelessWidget {
  const AppRoundedIcon({
    super.key,
    this.color,
    this.borderColor,
    this.iconImage,
    this.hasBorder = true,
    this.size,
  });

  final Color? color;
  final Color? borderColor;
  final SvgPicture? iconImage;
  final bool hasBorder;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final defaultColor = context.colorScheme.secondary;
    return Container(
      height: size ?? AppDimens.xsContainerSize * 1.3,
      width: size ?? AppDimens.xsContainerSize * 1.3,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? defaultColor.withOpacity(.25),
        border: Border.all(
          color: borderColor ?? defaultColor,
          width: hasBorder ? 1.3 : .1,
        ),
      ),
      child: iconImage?.paddingSymmetric(
            horizontal: AppDimens.halfPadding,
            vertical: AppDimens.halfPadding,
          ) ??
          Assets.icons.time.svg().paddingSymmetric(
                horizontal: AppDimens.halfPadding / 2,
                vertical: AppDimens.halfPadding / 2,
              ),
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/app_dimens.dart';

enum _ButtonType {
  primary,
  secondary,
  success,
}

class AppButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool? isLoading;
  final double? radius;
  final VoidCallback? onPressed;
  final _ButtonType _buttonType;

  const AppButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.radius,
  }) : _buttonType = _ButtonType.primary;

  const AppButton.secondary({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.radius,
  }) : _buttonType = _ButtonType.secondary;

  const AppButton.success({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.radius,
  }) : _buttonType = _ButtonType.success;
  @override
  Widget build(BuildContext context) {
    late Color bgColor;
    late Color fgColor;

    switch (_buttonType) {
      case _ButtonType.primary:
        bgColor = context.colorScheme.primary;
        fgColor = context.colorScheme.onPrimary;
        break;
      case _ButtonType.secondary:
        bgColor = context.colorScheme.secondary;
        fgColor = context.colorScheme.onSecondary;
        break;
      case _ButtonType.success:
        bgColor = const Color(0xff35B760);
        fgColor = const Color(0xff35B760);
    }

    return SizedBox(
      height: AppDimens.btnSize,
      width: context.screenSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius ?? AppDimens.borderRadius,
            ),
            side: const BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon!,
                color: context.colorScheme.surface,
              ),
              Expanded(
                child: (isLoading == true)
                    ? SpinKitRipple(
                        color: context.colorScheme.surface,
                        size: AppDimens.loaderSize,
                      )
                    : Text(
                        title,
                        textAlign: TextAlign.center,
                        style: context.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colorScheme.surface,
                        ),
                      ),
              ),
            ] else
              (isLoading == true)
                  ? SpinKitRipple(
                      color: context.colorScheme.primary,
                      size: AppDimens.loaderSize,
                    )
                  : Text(
                      title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.surface,
                      ),
                    ),
          ],
        ),
      ),
    )
        .paddingSymmetric(horizontal: AppDimens.padding)
        .animate()
        .fadeIn(duration: 500.ms)
        .slide();
  }
}

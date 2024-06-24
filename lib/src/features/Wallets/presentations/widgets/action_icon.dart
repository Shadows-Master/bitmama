import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/domain/action.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionIcon extends ConsumerWidget {
  const ActionIcon({
    super.key,
    this.color,
    required this.action,
    this.size = AppDimens.xsContainerSize * 1.7,
    this.borderColor,
  });

  final Color? color;
  final IconAction action;
  final double? size;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, ref) {
    final actionChosen = ref.watch(actionProvider);
    final isEqual = identical(action, actionChosen);
    final colorScheme = context.colorScheme;
    return Column(
      children: [
        AppRoundedIcon(
          iconImage: action.actionIcon.svg(color: isEqual ? Colors.white : null),
          color: isEqual ? colorScheme.secondary : color,
          size: size,
          borderColor: borderColor,
        ),
        AppDimens.halfPadding.heightBox,
        AppTitle(
          title: action.title,
          fontWeight: (action.title.contains(AppString.account))
              ? FontWeight.w600
              : FontWeight.w200,
        )
      ],
    ).paddingSymmetric(horizontal: AppDimens.halfPadding * 1.5);
  }
}

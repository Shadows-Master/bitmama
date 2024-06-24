import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';

class ModalDivider extends StatelessWidget {
  const ModalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      color: context.colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(AppDimens.borderRadius / 1.2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: const SizedBox(
        height: AppDimens.xsContainerSize / 4,
        width: AppDimens.xsContainerSize * 2.5,
      ),
    );
  }
}

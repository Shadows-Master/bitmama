import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/app_title_icon.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/constants/app_dimens.dart';

class BalanceBox extends StatelessWidget {
  const BalanceBox({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.mdContainerSize,
      margin: const EdgeInsets.only(
        top: AppDimens.tripleSpacing * 1.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimens.doubleBorderRadius,
        ),
        border: Border.all(color: color.onPrimary, width: 1),
        color: color.surface.withOpacity(.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTitleIcon(),
              AppTitle.h0(
                title: "\$1444.99",
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          AppRoundedIcon(
            hasBorder: false,
            iconImage: Assets.icons.versions.svg(),
          )
        ],
      ).paddingSymmetric(horizontal: AppDimens.doubleSpacing),
    );
  }
}

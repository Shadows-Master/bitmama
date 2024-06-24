import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/constants/app_dimens.dart';

class TransactionItemTile extends StatelessWidget {
  const TransactionItemTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppRoundedIcon(
              iconImage: Assets.icons.moneyRecive.svg(),
              hasBorder: false,
            ),
            AppDimens.halfPadding.widthBox,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(title: AppString.name),
                AppTitle(title: AppString.date),
              ],
            ),
          ],
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppTitle(title: AppString.amount),
            AppTitle(title: AppString.status),
          ],
        ),
      ],
    ).paddingOnly(top: AppDimens.tripleSpacing);
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/action_sized_box.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/balance_box.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/app_dimens.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          BalanceBox(color: color),
          ActionSizedBox(color: color).alignAtCenter(),
        ],
      ),
    ).paddingSymmetric(
      horizontal: AppDimens.tripleSpacing,
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/transaction_trending_container.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/balance_container.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/constants/app_dimens.dart';

class WalletPageView extends StatelessWidget {
  const WalletPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              (AppDimens.padding).heightBox,
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const AppRoundedIcon(),
                          AppDimens.halfPadding.widthBox,
                          const AppTitle.h2(title: AppString.fullGreetings),
                          AppDimens.halfPadding.widthBox,
                          Assets.icons.moneyBag.svg()
                        ],
                      ),
                    ),
                    Assets.icons.bell.svg()
                  ],
                ),
              ).paddingSymmetric(horizontal: AppDimens.tripleSpacing),
              BalanceContainer(color: color),
              TransactionTrendingContainer(color: color),
            ],
          ),
        ),
      ),
    );
  }
}

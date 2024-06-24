import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Sells/domain/mobile_money.dart';
import 'package:bitmama/src/features/Sells/domain/payment_method.dart';
import 'package:bitmama/src/features/Sells/presentations/widgets/gateway_modal.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/asset.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/asset_widget_row.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/components/buttons/app_button.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../generated/assets.gen.dart';

class SellPageView extends ConsumerWidget {
  const SellPageView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colorScheme = context.colorScheme;
    final assetBtc = ref.watch(assetProvider);
    final mobileAsset = ref.watch(mobileMoneyProvider);
    final gateway = ref.watch(gatewayProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        centerTitle: true,
        title: const AppTitle.h2(
          title: "Sell MTN Money",
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppDimens.smContainerSize * 1.7,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(
                  AppDimens.doubleBorderRadius,
                ),
                border: Border.all(
                  width: 1,
                  color: colorScheme.secondary,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTitle.h5(
                        title: "You Sell",
                        fontWeight: FontWeight.w200,
                      ),
                      Row(
                        children: [
                          AssetWidgetRow(asset: assetBtc),
                          AppDimens.padding.widthBox,
                          Assets.icons.chevronDown.svg()
                        ],
                      ),
                    ],
                  ),
                  const AppTitle.h0(
                    title: "0.0000",
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ).paddingSymmetric(horizontal: AppDimens.doubleBorderRadius),
            ),
            AppDimens.padding.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppTitle.h4(
                  title: "Exchange rate",
                  fontWeight: FontWeight.w200,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const AppTitle.h5(
                      title: "~0.09 SATS",
                      fontWeight: FontWeight.w200,
                    ),
                    AppDimens.halfSpacing.heightBox,
                    const AppTitle.h5(
                      title: "\$123.00",
                      fontWeight: FontWeight.w200,
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: AppDimens.doubleBorderRadius),
            AppDimens.padding.heightBox,
            const AppTitle.h5(
              title: "1 BTC is approx \$34,780",
              fontWeight: FontWeight.w200,
            ).alignAtCenterLeft().paddingOnly(left: AppDimens.doubleSpacing),
            AppDimens.doublePadding.heightBox,
            Container(
              height: AppDimens.smContainerSize * 1.7,
              decoration: BoxDecoration(
                color: colorScheme.surfaceTint,
                borderRadius: BorderRadius.circular(
                  AppDimens.doubleBorderRadius,
                ),
                border: Border.all(
                  width: .1,
                  color: colorScheme.secondary,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTitle.h5(
                        title: "Recipient gets",
                        fontWeight: FontWeight.w200,
                      ),
                      Row(
                        children: [
                          AssetWidgetRow(asset: mobileAsset),
                          AppDimens.padding.widthBox,
                          Assets.icons.chevronDown.svg()
                        ],
                      ),
                    ],
                  ),
                  const AppTitle.h0(
                    title: "0.0000",
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ).paddingSymmetric(horizontal: AppDimens.doubleBorderRadius),
            ),
            AppDimens.doublePadding.heightBox,
            Container(
              height: AppDimens.smContainerSize * 1.2,
              decoration: BoxDecoration(
                color: colorScheme.surfaceTint,
                borderRadius: BorderRadius.circular(
                  AppDimens.doubleBorderRadius,
                ),
                border: Border.all(
                  width: .8,
                  color: colorScheme.onSurface,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppTitle(title: "Payment Method"),
                  Assets.icons.chevronDown.svg(),
                ],
              ).paddingSymmetric(horizontal: AppDimens.doubleBorderRadius).onTap((){
                _showGatewayBottomSheet(context, ref);
              }),
            ),

            AppDimens.doublePadding.heightBox,
            AppButton(title: "convert", onPressed: gateway.isNull() ? null : (){

            }, )
          ],
        ).paddingSymmetric(horizontal: AppDimens.tripleSpacing),
      ),
    );
  }

  void _showGatewayBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.doubleBorderRadius),
        ),
      ),
      builder: (context) {
        return GatewayModal(ref: ref, gateways: gateways);
      },
    );
  }
}

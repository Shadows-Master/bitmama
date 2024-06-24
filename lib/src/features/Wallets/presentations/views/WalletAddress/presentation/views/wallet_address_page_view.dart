import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/asset.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/network.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/change_asset_widget.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/asset_qr_code_widget.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:bitmama/src/shared/components/buttons/app_button.dart';
import 'package:bitmama/src/shared/components/leading_back_button.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../generated/assets.gen.dart';
import '../../../../../../../shared/components/app_title.dart';
import '../../../../../../../shared/components/modal_divider.dart';

class WalletAddressPageView extends ConsumerWidget {
  const WalletAddressPageView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final color = context.colorScheme;
    final asset = ref.watch(assetProvider);
    final networkAsset = ref.watch(networkAssetProvider);
    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        leading: const LeadingBackButton(),
        centerTitle: true,
        title: const AppTitle.h2(title: AppString.walletAddress),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(networkAssetProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChangeAssetWidget(
                asset: asset,
                ref: ref,
              ),
              AssetQrCodeWidget(
                color: color,
                networkAsset: networkAsset,
              ),
              AppDimens.tripleSpacing.heightBox,
              if (!networkAsset.isNull())
                AppButton(
                  title: "Done",
                  onPressed: () {
                    _showReceiveResumeBottomSheet(context);
                  },
                )
            ],
          ).paddingSymmetric(horizontal: AppDimens.tripleSpacing),
        ),
      ),
    );
  }

  void _showReceiveResumeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.doubleBorderRadius),
        ),
      ),
      builder: (context) {
        return Container(
          height: AppDimens.xlContainerSize * 1.2,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDimens.doubleBorderRadius),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ModalDivider().alignAtCenter(),
              (AppDimens.tripleSpacing).heightBox,
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(top: AppDimens.doubleSpacing),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTitle.h2(title: AppString.receiveMoney),
                    AppTitle.h4(
                      title: AppString.receiveMoneySubtitle,
                      fontWeight: FontWeight.w200,
                    ),
                  ],
                ).paddingSymmetric(vertical: AppDimens.padding),
              ),
              (AppDimens.tripleSpacing * 1.8).heightBox,
              const AppTitle(title: AppString.depositLink),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.onSurface),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    AppDimens.borderRadius,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppTitle.h2(
                        title: 'https://${AppString.addressValue}',),
                    AppRoundedIcon(
                      iconImage: Assets.icons.copy.svg(),
                      hasBorder: false,
                    )
                  ],
                ).paddingSymmetric(
                  vertical: AppDimens.padding,
                  horizontal: AppDimens.padding,
                ),
              ),
              const Spacer(),
              AppButton(
                title: "Done",
                onPressed: () {
                  _showReceiveResumeBottomSheet(context);
                },
              ),
              (AppDimens.tripleSpacing).heightBox,
            ],
          ),
        );
      },
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/asset.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/asset_widget_row.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/modal_change_asset.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../shared/components/app_title.dart';

class ChangeAssetWidget extends StatelessWidget {
  const ChangeAssetWidget({
    super.key,
    required this.asset,
    required this.ref,
  });

  final WalletAsset asset;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.xsContainerSize * 2.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimens.doubleBorderRadius * 2,
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AssetWidgetRow(asset: asset),
          const AppTitle(
            title: AppString.changeAssets,
            fontWeight: FontWeight.w200,
          ).onTap(() {
            _showAssetBottomSheet(context);
          }),
        ],
      ).paddingSymmetric(horizontal: AppDimens.padding),
    ).paddingSymmetric(vertical: AppDimens.tripleSpacing);
  }

  void _showAssetBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.doubleBorderRadius),
        ),
      ),
      builder: (context) {
        return ModalChangeAsset(ref: ref);
      },
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/network.dart';
import 'package:flutter/material.dart';

import '../../../../../../../shared/components/app_title.dart';
import '../../../../../../../shared/constants/app_dimens.dart';

class AssetWidgetRow extends StatelessWidget {
  const AssetWidgetRow({
    super.key,
    required this.asset,
  });

  final dynamic asset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         asset.assetImage,
        AppDimens.halfSpacing.widthBox,
        AppTitle(title: asset.title),
      ],
    );
  }
}

class NetworkWidgetRow extends StatelessWidget {
  const NetworkWidgetRow({
    super.key,
    required this.networkAsset,
  });

  final NetworkAsset networkAsset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        networkAsset.assetImage,
        AppTitle(title: networkAsset.title),
      ],
    );
  }
}

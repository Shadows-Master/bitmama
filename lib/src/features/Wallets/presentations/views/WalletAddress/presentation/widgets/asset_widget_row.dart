import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/asset.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/network.dart';
import 'package:flutter/material.dart';

import '../../../../../../../shared/components/app_title.dart';

class AssetWidgetRow extends StatelessWidget {
  const AssetWidgetRow({
    super.key,
    required this.asset,
  });

  final WalletAsset asset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         asset.assetImage,
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

import 'package:bitmama/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../shared/constants/app_string.dart';

class WalletAsset {
  final String title;
  final SvgPicture assetImage;

  WalletAsset({
    required this.title,
    required this.assetImage,
  });
}

final List<WalletAsset> assets = [
  WalletAsset(
    title: AppString.btc,
    assetImage: Assets.icons.bitcoinBtc.svg(),
  ),
  WalletAsset(
    title: AppString.eth,
    assetImage: Assets.icons.ethereumEth.svg(),
  ),
];

final assetProvider = StateProvider<WalletAsset>(
  (ref) => WalletAsset(
    title: AppString.btc,
    assetImage: Assets.icons.bitcoinBtc.svg(),
  ),
);


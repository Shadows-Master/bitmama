import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../generated/assets.gen.dart';

class NetworkAsset {
  final String title;
  final SvgPicture assetImage;

  NetworkAsset({
    required this.title,
    required this.assetImage,
  });
}

final List<NetworkAsset> networks = [
  NetworkAsset(
    title: AppString.btc,
    assetImage: Assets.icons.bitcoinBtc.svg(),
  ),
  NetworkAsset(
    title: AppString.eth,
    assetImage: Assets.icons.ethereumEth.svg(),
  ),
  NetworkAsset(
    title: AppString.trx,
    assetImage: Assets.icons.bitcoinBtc.svg(),
  ),
];


extension NetworkAssetExtension on NetworkAsset? {
  bool isNull() => this == null;
}


final networkAssetProvider = StateProvider<NetworkAsset?>((ref) => null);

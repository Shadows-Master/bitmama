import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.gen.dart';
import '../../../shared/constants/app_string.dart';

class MobileMoney {
  final String title;
  final SvgPicture assetImage;

  MobileMoney({
    required this.title,
    required this.assetImage,
  });
}

final List<MobileMoney> assets = [
  MobileMoney(
    title: AppString.mtn,
    assetImage: Assets.icons.bitcoinBtc.svg(),
  ),
  MobileMoney(
    title: AppString.ora,
    assetImage: Assets.icons.ethereumEth.svg(),
  ),
];

final mobileMoneyProvider = StateProvider<MobileMoney>(
  (ref) => MobileMoney(
    title: AppString.btc,
    assetImage: Assets.icons.bitcoinBtc.svg(),
  ),
);

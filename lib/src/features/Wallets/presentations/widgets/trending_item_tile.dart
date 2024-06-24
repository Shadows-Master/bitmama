import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/crypto_box.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingItemTile extends StatelessWidget {
  const TrendingItemTile({
    super.key,
    required this.color,
    this.cryptoImage,
    this.cryptoTitle,
  });

  final ColorScheme color;
  final SvgPicture? cryptoImage;
  final String? cryptoTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CryptoBox(
          color: color,
          cryptoImage: cryptoImage,
          cryptoTitle: cryptoTitle,
        ),
        const AppTitle.h2(title: AppString.trendingValue)
      ],
    ).paddingOnly(top: AppDimens.tripleSpacing);
  }
}

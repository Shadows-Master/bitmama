import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/constants/app_dimens.dart';

class CryptoBox extends StatelessWidget {
  const CryptoBox({
    super.key,
    required this.color, this.cryptoImage, this.cryptoTitle,
  });

  final ColorScheme color;
  final SvgPicture? cryptoImage;
  final String? cryptoTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.containerSize / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimens.doubleBorderRadius * 1.2,
        ),
        color: color.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          cryptoImage ?? Assets.icons.bitcoinBtc.svg(),
           AppTitle(
            title: cryptoTitle ?? AppString.btc,
            color: Colors.white,
          )
        ],
      ).paddingSymmetric(
        vertical: AppDimens.halfPadding / 2,
      ),
    );
  }
}

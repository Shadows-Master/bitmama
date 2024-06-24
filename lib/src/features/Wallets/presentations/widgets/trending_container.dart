import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/trending_item_tile.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.gen.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 3.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitle(
            title: AppString.trending,
            fontWeight: FontWeight.w600,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              TrendingItemTile(color: color),
              TrendingItemTile(
                color: color,
                cryptoTitle: AppString.trendingEth,
                cryptoImage: Assets.icons.ethereumEth.svg(),
              ),
              TrendingItemTile(color: color),
            ],
          ).expanded()
        ],
      ),
    );
  }
}

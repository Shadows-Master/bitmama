import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/last_transaction_container.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/trending_container.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/app_dimens.dart';

class TransactionTrendingContainer extends StatelessWidget {
  const TransactionTrendingContainer({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.surface,
      child: Column(
        children: [
          TrendingContainer(color: color),
          LastTransactionContainer(color: color),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.tripleSpacing,
        vertical: AppDimens.tripleSpacing,
      ),
    );
  }
}

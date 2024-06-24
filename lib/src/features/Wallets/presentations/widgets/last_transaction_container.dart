import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/transaction_item_box.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';

class LastTransactionContainer extends StatelessWidget {
  const LastTransactionContainer({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppTitle(title: AppString.lastTransactions),
              AppTitle(
                title: AppString.moreTransactions,
                color: color.secondary,
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: const [
              TransactionItemTile(),
              TransactionItemTile(),
              TransactionItemTile(),
              TransactionItemTile(),
            ],
          ).expanded()
        ],
      ),
    );
  }
}

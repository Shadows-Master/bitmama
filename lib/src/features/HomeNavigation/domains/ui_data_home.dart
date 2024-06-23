import 'package:flutter/material.dart';

import '../../../../generated/assets.gen.dart';

class UiDataHome {
  final String? label;
  final Widget? icon;
  final Widget? selectedIcon;

  UiDataHome({
    this.label,
    this.icon,
     this.selectedIcon,
  });
}

final List<UiDataHome> data = [
  UiDataHome(label: "Wallets", icon: Assets.icons.wallet.image(),),
  UiDataHome(label: "Payment", icon: Assets.icons.receiptText.image(),),
  UiDataHome(label: "Sell", icon: Assets.icons.cardSend.image(),),
  UiDataHome(label: "Account", icon: Assets.icons.user.image(),),
];
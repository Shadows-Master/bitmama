import '../../../../generated/assets.gen.dart';

class UiDataHome {
  final String label;
  final SvgGenImage icon;

  UiDataHome({
    required this.label,
    required this.icon,
  });
}

final List<UiDataHome> data = [
  UiDataHome(
    label: "Wallets",
    icon: Assets.icons.wallet,
  ),
  UiDataHome(
    label: "Payment",
    icon: Assets.icons.receiptText,
  ),
  UiDataHome(
    label: "Sell",
    icon: Assets.icons.cardSend,
  ),
  UiDataHome(
    label: "Account",
    icon: Assets.icons.user,
  ),
];

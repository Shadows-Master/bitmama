import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../generated/assets.gen.dart';

class Withdraw {
  final String title;
  final String subtitle;
  final SvgPicture icon;

  Withdraw({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

final List<Withdraw> withdraws = [
  Withdraw(
    title: 'Wallet Address (USDT)',
    subtitle: 'Receive local currency or crypto from anyone',
    icon: Assets.icons.group.svg(),
  ),
  Withdraw(
    title: 'MTN mobile money',
    subtitle: 'Receive local currency or crypto from anyone',
    icon: Assets.icons.group.svg(),
  ),
  Withdraw(
    title: 'Debit Card',
    subtitle: 'Visa, Master card, Verve',
    icon: Assets.icons.group.svg(),
  ),
];


extension WithdrawExtension on Withdraw? {
  bool isNull() => this == null;
}

final withdrawProvider = StateProvider<Withdraw?>((ref) => null);
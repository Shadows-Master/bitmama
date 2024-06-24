import 'package:bitmama/src/features/Wallets/presentations/widgets/action_icon.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.gen.dart';

class IconAction {
  final String title;
  final SvgGenImage actionIcon;

  IconAction({
    required this.title,
    required this.actionIcon,
  });
}

final List<IconAction> actions = [
  IconAction(
    title: AppString.account,
    actionIcon: Assets.icons.moneys,
  ),
  IconAction(
    title: AppString.receive,
    actionIcon: Assets.icons.plus,
  ),
  IconAction(
    title: AppString.send,
    actionIcon: Assets.icons.arrowUpRight,
  ),
  IconAction(
    title: AppString.swap,
    actionIcon: Assets.icons.swap,
  ),
];

extension ActionIconExtension on ActionIcon? {
  bool isNull() => this == null;
}

final actionProvider = StateProvider<IconAction?>((ref) => null);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../generated/assets.gen.dart';

class Gateway {
  final String title;
  final String subtitle;
  final SvgPicture icon;

  Gateway({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

final List<Gateway> gateways = [

  Gateway(
    title: 'MTN mobile money',
    subtitle: 'Receive local currency or crypto from anyone',
    icon: Assets.icons.group.svg(),
  ),
  Gateway(
    title: 'Debit Card',
    subtitle: 'Visa, Master card, Verve',
    icon: Assets.icons.group.svg(),
  ),
];


extension GatewayExtension on Gateway? {
  bool isNull() => this == null;
  bool isNotNull() => this != null;
}

final gatewayProvider = StateProvider<Gateway?>((ref) => null);
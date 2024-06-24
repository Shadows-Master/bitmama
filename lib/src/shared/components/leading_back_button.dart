import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';


class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({
    super.key, this.icon,
  });

  final SvgPicture? icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon ??  Icon(
        Iconsax.arrow_left_2,
        color: context.colorScheme.primary,
      ),
      onPressed: () {
        context.pop();
      },
    );
  }
}

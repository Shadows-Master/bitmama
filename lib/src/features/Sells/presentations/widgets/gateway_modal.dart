import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/components/app_title.dart';
import '../../../../shared/components/modal_divider.dart';
import '../../../../shared/constants/app_dimens.dart';
import '../../../../shared/constants/app_string.dart';
import '../../domain/payment_method.dart';

class GatewayModal extends StatelessWidget {
  const GatewayModal({
    super.key,
    required this.ref,
    required this.gateways,
  });

  final List<Gateway> gateways;
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.doubleBorderRadius),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModalDivider().alignAtCenter(),
          modalTitle(),
          gatewaysListBuilder(context).expanded(),
        ],
      ),
    );
  }

  ListView gatewaysListBuilder(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: gateways.length,
      itemBuilder: (ctx, index) {
        final gateway = gateways.elementAt(index);
        return Container(
          margin: const EdgeInsets.only(top: AppDimens.doubleSpacing),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimens.borderRadius,
            ),
            border: Border.all(
              width: .7,
              color: context.colorScheme.onSurface,
            ),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.borderRadius,
              ),
            ),
            leading: gateway.icon,
            title: AppTitle(title: gateway.title),
            subtitle: AppTitle(
              title: gateway.subtitle,
              fontWeight: FontWeight.w200,
            ),
            onTap: () {
              ref.read(gatewayProvider.notifier).update((state) => gateway);
              GoRouter.of(context).pop();
            },
          )
        );
      },
    );
  }

  Column modalTitle({List<Gateway>? gateways}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDimens.padding.heightBox,
        AppTitle.h1(
          title: gateways == null ? 'Payment Methods' : AppString.networkTitle,
        ),
        AppTitle(
          title: gateways == null
              ? AppString.assetSubtitle
              : AppString.networkSubtitle,
          fontWeight: FontWeight.w200,
        ),
      ],
    );
  }
}

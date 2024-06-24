import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/asset.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/controllers/controller.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/asset_widget_row.dart';
import 'package:bitmama/src/shared/components/modal_divider.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../shared/components/app_title.dart';
import '../../domain/network.dart';

class ModalChangeAsset extends StatelessWidget {
  const ModalChangeAsset({
    super.key,
    required this.ref,
    this.networks,
  });

  final List<NetworkAsset>? networks;
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
          modalTitle(networks: networks),
          networks == null
              ? assetListBuilder(context).expanded()
              : networkListBuilder(context).expanded(),
        ],
      ),
    );
  }

  ListView assetListBuilder(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: networks?.length ?? assets.length,
      itemBuilder: (ctx, index) {
        final asset = assets.elementAt(index);
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
            title: AssetWidgetRow(asset: asset),
            onTap: () {
              ref.read(assetProvider.notifier).update((state) => asset);
              context.pop();
            },
          ),
        );
      },
    );
  }

  ListView networkListBuilder(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: networks?.length,
      itemBuilder: (ctx, index) {
        final network = networks?.elementAt(index);
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
            title: NetworkWidgetRow(networkAsset: network!),
            onTap: () {
              ref.read(controllerProvider.notifier).getNetwork(network);
              context.pop();
            },
          ),
        );
      },
    );
  }

  Column modalTitle({List<NetworkAsset>? networks}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDimens.padding.heightBox,
        AppTitle.h1(
          title:
              networks == null ? AppString.assetTitle : AppString.networkTitle,
        ),
        AppTitle(
          title: networks == null
              ? AppString.assetSubtitle
              : AppString.networkSubtitle,
          fontWeight: FontWeight.w200,
        ),
      ],
    );
  }
}

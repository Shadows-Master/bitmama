import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/network.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/controllers/controller.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/app_title_icon.dart';
import 'package:bitmama/src/shared/components/app_rounded_icon.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../../../generated/assets.gen.dart';
import '../../../../../../../shared/components/app_title.dart';
import 'modal_change_asset.dart';

class AssetQrCodeWidget extends ConsumerWidget {
  const AssetQrCodeWidget({
    super.key,
    required this.color,
    required this.networkAsset,
  });

  final ColorScheme color;
  final NetworkAsset? networkAsset;

  @override
  Widget build(BuildContext context, ref) {
    final networkState = ref.watch(controllerProvider);
    return Material(
      elevation: 1.2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(
        AppDimens.doubleBorderRadius * 1.2,
      ),
      color: Colors.white,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTitleIcon(
              color: color.primary,
              icon: Assets.icons.chevronDown.svg(),
              title: networkAsset.isNull()
                  ? AppString.chooseNetwork
                  : networkAsset?.title,
              fontWeight: FontWeight.w600,
              mainAxisAlignment: MainAxisAlignment.center,
            )
                .paddingSymmetric(
              horizontal: AppDimens.padding,
              vertical: AppDimens.padding,
            )
                .onTap(() {
              _showNetworkBottomSheet(context, ref);
            }),
            if (networkState.isLoading && networkAsset.isNull())
              CircularProgressIndicator(
                backgroundColor: color.primary.withOpacity(.2),
                valueColor: AlwaysStoppedAnimation<Color>(color.primary),
                strokeWidth: 8.0,
              ),
            (networkAsset.isNull())
                ? QrImageView(
                    data: 'Default Value',
                    version: QrVersions.auto,
                    size: 300.0,
                    gapless: false,
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(80, 80),
                    ),
                  )
                : QrImageView(
                    data: networkAsset!.title,
                    version: QrVersions.auto,
                    size: 300.0,
                    gapless: false,
                    embeddedImage: AssetImage(Assets.images.officeWorker.path),
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(80, 80),
                    ),
                  ).paddingSymmetric(
                    horizontal: AppDimens.doublePadding,
                    vertical: AppDimens.padding,
                  ),
            const AppTitle(
              title: AppString.scanAddressSms,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTitle(
                      title: AppString.address,
                      fontWeight: FontWeight.w200,
                    ),
                    AppTitle(
                      title: AppString.addressValue,
                      maxLines: 1,
                    ),
                  ],
                ).expanded(flex: 4),
                AppRoundedIcon(
                  iconImage: Assets.icons.copy.svg(),
                  hasBorder: false,
                ).expanded()
              ],
            ).paddingSymmetric(
              horizontal: AppDimens.padding,
              vertical: AppDimens.padding,
            )
          ],
        ),
      ),
    );
  }

  void _showNetworkBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.doubleBorderRadius),
        ),
      ),
      builder: (context) {
        return ModalChangeAsset(
          ref: ref,
          networks: networks,
        );
      },
    );
  }
}

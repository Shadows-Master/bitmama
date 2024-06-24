import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/core/routing/app_router.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/withdraw.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/components/buttons/app_button.dart';
import 'package:bitmama/src/shared/components/forms/app_form_field.dart';
import 'package:bitmama/src/shared/components/forms/app_form_icon.dart';
import 'package:bitmama/src/shared/constants/app_dimens.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../generated/assets.gen.dart';
import '../../../../../../../shared/components/modal_divider.dart';
import '../../../../../../../shared/constants/app_string.dart';

class SendWalletAddress extends ConsumerWidget {
  const SendWalletAddress({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final withdraw = ref.watch(withdrawProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (AppDimens.doubleSpacing).heightBox,
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle.h2(title: AppString.withdrawUsdt),
            AppTitle.h4(
              title: AppString.withdrawSubtitle,
              fontWeight: FontWeight.w200,
            ),
          ],
        ),
        (AppDimens.tripleSpacing).heightBox,
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTitle.h4(
                title: AppString.address,
                fontWeight: FontWeight.w200,
              ),
              AppFormField(
                hintText: 'Long press to paste',
                readOnly: true,
                suffixIcon: AppFormIcon(
                  isRight: false,
                  icon: Assets.icons.maximize.svg(),
                ),
                onTap: () {
                  _showReceiveResumeBottomSheet(context, ref);
                },
              ),
              (AppDimens.doubleSpacing).heightBox,
              const AppTitle.h4(
                title: AppString.networkTitle,
                fontWeight: FontWeight.w200,
              ),
              const AppFormField(
                hintText: 'Select network',
                readOnly: true,
              ),
              (AppDimens.doubleSpacing).heightBox,
              const AppTitle.h4(
                title: "Amount",
                fontWeight: FontWeight.w200,
              ),
              const AppFormField(
                hintText: '0.0',
                suffixIcon: AppFormIcon(
                  isRight: false,
                  text: 'Max',
                ),
              ),
              (AppDimens.doubleSpacing).heightBox,
            ],
          ),
        ),
        if (!withdraw.isNull())
           SizedBox(
            width: AppDimens.lgContainerSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTitle(title: "Summary"),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitle(title: "USDT"),
                    AppTitle(title: "\$420.69"),
                  ],
                ).paddingSymmetric(vertical: AppDimens.doubleSpacing),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitle(title: "Transfers fees", fontWeight: FontWeight.w300,),
                    AppTitle(title: "\$420.69"),
                  ],
                ).paddingSymmetric(vertical: AppDimens.doubleSpacing),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitle(title: "Transfers fees", fontWeight: FontWeight.w300,),
                    AppTitle(title: "\$420.69"),
                  ],
                ).paddingSymmetric(vertical: AppDimens.doubleSpacing),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitle(title: "Total"),
                    AppTitle(title: "\$420.69"),
                  ],
                ).paddingSymmetric(vertical: AppDimens.doubleSpacing),
              ],
            ),
          ),
        AppDimens.mdContainerSize.heightBox,
        AppButton(
          title: AppString.withdraw,
          onPressed: withdraw.isNull() ? null : () {
            GoRouter.of(context).pushNamed(AppRoutes.otp.name);
          },
        ),
        (AppDimens.doubleSpacing).heightBox,
      ],
    ).paddingSymmetric(horizontal: AppDimens.tripleSpacing);
  }

  void _showReceiveResumeBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.doubleBorderRadius),
        ),
      ),
      builder: (context) {
        return Container(
          height: AppDimens.xlContainerSize * 1.4,
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
              (AppDimens.tripleSpacing).heightBox,
              const AppTitle.h2(title: AppString.withdraw),
              const AppTitle(
                title: AppString.networkSubtitle,
                fontWeight: FontWeight.w200,
              ),
              (AppDimens.tripleSpacing).heightBox,
              withdrawListBuilder(context, ref),
              (AppDimens.tripleSpacing * 1.8).heightBox,
            ],
          ),
        );
      },
    );
  }

  ListView withdrawListBuilder(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: withdraws.length,
      itemBuilder: (ctx, index) {
        final withdraw = withdraws.elementAt(index);
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
            leading: withdraw.icon,
            title: AppTitle(title: withdraw.title),
            subtitle: AppTitle(
              title: withdraw.subtitle,
              fontWeight: FontWeight.w200,
            ),
            onTap: () {
              ref.read(withdrawProvider.notifier).update((state) => withdraw);
              GoRouter.of(context).pop();
            },
          ),
        );
      },
    );
  }
}

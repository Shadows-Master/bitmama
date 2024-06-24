import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/components/app_alert_dialog.dart';
import 'package:bitmama/src/shared/components/app_title.dart';
import 'package:bitmama/src/shared/components/buttons/app_button.dart';
import 'package:bitmama/src/shared/components/leading_back_button.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:bitmama/src/shared/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/constants/app_dimens.dart';

class OtpPageView extends StatelessWidget {
  OtpPageView({super.key});

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = context.colorScheme.primary;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final defaultPinTheme = PinTheme(
      width: AppDimens.containerSize / 2,
      height: AppDimens.xsContainerSize * 2,
      textStyle: context.headlineLarge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.doubleBorderRadius),
          border: Border.all(color: context.colorScheme.onSurface),
          color: Colors.white),
    );
    return Scaffold(
      backgroundColor: context.surface,
      appBar: AppBar(
        leading: LeadingBackButton(icon: Assets.icons.close.svg()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitle.h2(
            title: "Enter 2FA pin",
            fontWeight: FontWeight.w700,
          ),
          const AppTitle(
            title: "Enter the 4-digits code",
            fontWeight: FontWeight.w200,
          ),
          Form(
            key: formKey,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              length: 4,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(
                width: AppDimens.padding * 1.3,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'this field is required';
                }
                if (value.isNotEmpty && value.length == 4) {
                  AppAlertDialog(
                    message: "Your withdraw will be processed soon!",
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: AppButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            title: 'Full Width Button',
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return null;
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: context.colorScheme.error),
              ),
            ),
          ).alignAtCenter().paddingSymmetric(
                vertical: AppDimens.tripleSpacing * 2,
              ),
          Assets.icons.profil
              .svg(
                height: AppDimens.btnSize / 1.2,
                width: AppDimens.btnSize / 1.2,
              )
              .toCenter()
            .onTap(() {
              AppHelpers.showAlert(
                context: context,
                child: const AppAlertDialog.success(
                  message: "Your withdraw will be processed soon!",
                ),
              );
            }),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.tripleSpacing,
        vertical: AppDimens.tripleSpacing,
      ),
    );
  }
}

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/core/routing/app_router.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../shared/components/app_title.dart';
import '../../../../shared/components/buttons/app_button.dart';
import '../../../../shared/constants/app_dimens.dart';
import '../../domain/step.dart';
import '../controllers/intro_controller.dart';

class IntroPageView extends ConsumerWidget {
  const IntroPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(introPaginateProvider);
    final pageController = PageController(initialPage: currentIndex);

    Widget dot(length, {int index = 0}) {
      final indexValue = currentIndex;
      final dotTile = List.generate(
        length,
        (index) => Container(
          height: AppDimens.borderRadius * 1.2,
          width: AppDimens.borderRadius * 1.2,
          margin: const EdgeInsets.only(right: AppDimens.halfSpacing),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: .8,
              color: context.colorScheme.scrim,
            ),
            color: indexValue == index
                ? const Color(0xff35B760)
                : Colors.grey.shade100,
          ),
        ),
      );
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [...dotTile],
      ).paddingSymmetric(
        horizontal: AppDimens.doublePadding,
        vertical: AppDimens.doublePadding,
      );
    }

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (AppDimens.tripleSpacing * 2).heightBox,
            if (currentIndex < steps.length - 1)
              const AppTitle(title: "Skip").alignAtTopRight().onTap(() {
                pageController.jumpToPage(steps.length - 1);
              }),
            (AppDimens.tripleSpacing * 2).heightBox,
            Assets.images.logo.image().alignAtCenter(),
            (AppDimens.tripleSpacing * 1.2).heightBox,
            PageView(
              controller: pageController,
              children: List.generate(
                steps.length,
                (index) {
                  final step = steps.elementAt(index);
                  return Column(
                    children: [
                      step.illustration.image(scale: 1.2),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppDimens.doubleSpacing.heightBox,
                          AppTitle.h1(
                            title: step.title,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                          ),
                          AppDimens.doubleSpacing.heightBox,
                          AppTitle(
                            title: step.description,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
              onPageChanged: (value) {
                ref
                    .read(introPaginateProvider.notifier)
                    .update((state) => value);
              },
            ).expanded(flex: 6),
            dot(steps.length, index: currentIndex),
            if (currentIndex == steps.length - 1)
              AppButton.success(
                title: "Get Started",
                onPressed: () {
                  ref.read(introStateProvider.notifier).completedIntro();
                  if (context.mounted) context.goNamed(AppRoutes.wallet.name);
                },
              ),
            const Spacer(),
            AppDimens.doubleSpacing.heightBox,
          ],
        ),
      ).paddingSymmetric(horizontal: AppDimens.padding),
    );
  }
}

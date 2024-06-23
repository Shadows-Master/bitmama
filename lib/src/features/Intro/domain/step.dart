import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../generated/assets.gen.dart';

class Step {
  final String title;
  final String description;
  final AssetGenImage illustration;

  Step(
      {required this.title,
      required this.description,
      required this.illustration,});
}

final List<Step> steps = [
  Step(
    title: AppString.firstStepTitle,
    description: AppString.firstStepDesc,
    illustration: Assets.images.bitcoinPana,
  ),
  Step(
    title: AppString.sndStepTitle,
    description: AppString.sndStepDesc,
    illustration: Assets.images.wallet1,
  ),
  Step(
    title: AppString.thirdStepTitle,
    description: AppString.thirdStepDesc,
    illustration: Assets.images.onboard3,
  ),
];

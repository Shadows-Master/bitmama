import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/domain/action.dart';
import 'package:bitmama/src/features/Wallets/presentations/widgets/action_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/constants/app_dimens.dart';

class ActionSizedBox extends ConsumerWidget {
  const ActionSizedBox({
    super.key,
    required this.color,
  });

  final ColorScheme color;

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ...List.generate(actions.length, (index){
            final action = actions.elementAt(index);
            return (index == 0) ? ActionIcon(action: action) : ActionIcon(
              color: Colors.white,
              action: action,
              size: AppDimens.xsContainerSize * 1.7,
              borderColor: color.onSurface,
            ).onTap((){
              ref.read(actionProvider.notifier).update((state) => action);
            });
          })

        ],
      ),
    ).paddingSymmetric(
      vertical: AppDimens.tripleSpacing,
    );
  }
}

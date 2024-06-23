import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/app_dimens.dart';
import '../../domains/ui_data_home.dart';

class HomeNavigationWidget extends StatelessWidget {
  const HomeNavigationWidget({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: body.paddingOnly(top: AppDimens.padding),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        backgroundColor: context.colorScheme.surface,
        elevation: 0.0,
        indicatorColor: Colors.transparent,
        indicatorShape: const CircleBorder(),
        destinations: [
          ...data.map(
            (e) => NavigationDestination(
              icon: e.icon!,
              label: e.label!,
              tooltip: e.label,
            ),
          )
        ],
      ),
    );
  }
}

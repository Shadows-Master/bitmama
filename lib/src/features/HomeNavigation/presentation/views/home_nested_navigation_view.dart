import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/home_navigation_widget.dart';

class HomeNestedNavigationView extends ConsumerWidget {
  const HomeNestedNavigationView({
    super.key,
    required this.navigationShell,
  });

  void onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeNavigationWidget(
      body: navigationShell,
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}

import 'dart:developer';

import 'package:bitmama/src/features/Account/presentations/views/account_page_view.dart';
import 'package:bitmama/src/features/Payments/presentations/views/payment_page_view.dart';
import 'package:bitmama/src/features/Sells/presentations/views/sell_page_view.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/wallet_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/HomeNavigation/presentation/views/home_nested_navigation_view.dart';
import '../../features/Intro/presentation/views/intro_page_view.dart';
import '../../features/Intro/repository/intro_repository.dart';

part 'app_router.g.dart';

//privates navigators keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _walletNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "wallet");
final _paymentsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'payments');
final _sellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sell');
final _accountNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account');

enum AppRoutes {
  intro,
  authenticate,
  emailVerify,
  home,
  wallet,
  payments,
  sell,
  account,
}

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final intro = ref.watch(introRepositoryProvider).requireValue;
  return GoRouter(
    initialLocation: '/intro',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isIntroCompleted = intro.isIntroComplete();
      final path = state.uri.path;
      log("isOnBoarding ===> $isIntroCompleted");
      log("path ===> $path");
      if (!isIntroCompleted) {
        if (path != '/intro') {
          return '/intro';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/intro',
        name: AppRoutes.intro.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: IntroPageView());
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (
          context,
          state,
          navigationShell,
        ) {
          return HomeNestedNavigationView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _walletNavigatorKey,
            routes: [
              GoRoute(
                path: '/wallets',
                name: AppRoutes.wallet.name,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: WalletPageView());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _paymentsNavigatorKey,
            routes: [
              GoRoute(
                path: '/payments',
                name: AppRoutes.payments.name,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: PaymentPageView());
                },
              ),
            ],
          ),
          StatefulShellBranch(navigatorKey: _sellNavigatorKey, routes: [
            GoRoute(
              path: '/sell',
              name: AppRoutes.sell.name,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: SellPageView());
              },
            ),
          ],),
          StatefulShellBranch(
            navigatorKey: _accountNavigatorKey,
            routes: [
              GoRoute(
                path: '/account',
                name: AppRoutes.account.name,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: AccountPageView());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

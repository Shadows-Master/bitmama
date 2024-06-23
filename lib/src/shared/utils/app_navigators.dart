import 'package:flutter/material.dart';

class AppNavigators{
  AppNavigators._();
  static final rootNavigator = GlobalKey<NavigatorState>();
  static final dashboardNavigator = GlobalKey<NavigatorState>(debugLabel: "dashboard");
  static final cardsNavigator = GlobalKey<NavigatorState>(debugLabel: 'cards');
  static final transactionsNavigator = GlobalKey<NavigatorState>(debugLabel: 'transactions');
  static final historiesNavigator = GlobalKey<NavigatorState>(debugLabel: 'histories');
  static final moreNavigator = GlobalKey<NavigatorState>(debugLabel: 'more');
  static final profileNavigator = GlobalKey<NavigatorState>(debugLabel: 'profile');
}
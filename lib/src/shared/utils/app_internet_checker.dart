import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { notDetermined, on, off }

class AppInternetChecker extends StateNotifier<NetworkStatus> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();

  late NetworkStatus lastResult;

  AppInternetChecker() : super(NetworkStatus.notDetermined) {
    lastResult = NetworkStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen(( result) {
      late NetworkStatus newState;
      switch (result.first) {
        case ConnectivityResult.mobile:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.wifi:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.off;
          break;
        case ConnectivityResult.bluetooth:
          break;
        case ConnectivityResult.ethernet:
          break;
        case ConnectivityResult.vpn:
          break;
        case ConnectivityResult.other:
          break;
      }

      if (newState != state) {
        state = newState;
      }
    });
  }
}

final internetCheckerState = StateNotifierProvider((ref) {
  return AppInternetChecker();
});

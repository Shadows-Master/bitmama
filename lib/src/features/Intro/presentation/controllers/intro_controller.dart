import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/intro_repository.dart';

part 'intro_controller.g.dart';

@riverpod
class IntroState extends _$IntroState {
  @override
  FutureOr<void> build() {}
  Future<void> completedIntro() async {
    final introRepository = ref.watch(introRepositoryProvider).requireValue;
    state = const AsyncLoading();
    state = await AsyncValue.guard(introRepository.setIntroComplete);
  }
}

final introPaginateProvider = StateProvider<int>((ref) => 0);

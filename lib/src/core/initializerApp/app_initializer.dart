import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/Intro/repository/intro_repository.dart';

part 'app_initializer.g.dart';

@Riverpod(keepAlive: true)
Future<void> appInitializer(AppInitializerRef ref) async {
  ref.onDispose(() {
    ref.invalidate(introRepositoryProvider);
  });

  await ref.watch(introRepositoryProvider.future);
}


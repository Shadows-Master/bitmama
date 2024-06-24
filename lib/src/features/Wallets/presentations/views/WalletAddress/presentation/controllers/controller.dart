import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/network.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class Controller extends _$Controller {
  @override
  FutureOr<void> build() async {
    return ;
  }

  Future <void> getNetwork(NetworkAsset network) async{
    state = const AsyncLoading();
    final updateNetworkState = ref.read(networkAssetProvider.notifier);
    state =  AsyncValue.guard(() {
      return Future.delayed(2.seconds, () => updateNetworkState.update((state) => network));
    }) as AsyncValue<void>;
  }
}

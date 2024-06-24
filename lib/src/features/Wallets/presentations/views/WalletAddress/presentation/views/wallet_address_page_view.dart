
import 'package:bitmama/src/features/Wallets/domain/action.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/domain/network.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/receive_wallet_address.dart';
import 'package:bitmama/src/features/Wallets/presentations/views/WalletAddress/presentation/widgets/send_wallet_address.dart';

import 'package:bitmama/src/shared/components/leading_back_button.dart';
import 'package:bitmama/src/shared/constants/app_string.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../shared/components/app_title.dart';

class WalletAddressPageView extends ConsumerWidget {
  const WalletAddressPageView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final color = context.colorScheme;
    final isActionReceive = ref.watch(isActionReceiveProvider);
    final isActionSend = ref.watch(isActionSendProvider);
    return Scaffold(
      backgroundColor:(isActionSend) ? Colors.white : color.surface,
      appBar: AppBar(
        leading: const LeadingBackButton(),
        centerTitle: true,
        title: const AppTitle.h2(title: AppString.walletAddress),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(networkAssetProvider);
        },
        child:  SingleChildScrollView(
          child: Column(
            children: [
              if (isActionReceive) const ReceiveWalletAddress(),
              if (isActionSend) const SendWalletAddress(),
            ],
          ),
        ),
      ),
    );
  }


}

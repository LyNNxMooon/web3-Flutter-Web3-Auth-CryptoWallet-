// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChain = 1;

  String currentAddress = "";

  int currentChain = -1;

  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == operatingChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future<void> connect() async {
    if (isEnabled) {
      final acc = await ethereum!.requestAccount();
      if (acc.isNotEmpty) currentAddress = acc.first;

      currentChain = await ethereum!.getChainId();

      notifyListeners();
    }
  }

  clear() {
    currentAddress = "";
    currentChain = -1;
    notifyListeners();
  }

  init() {
    if (isEnabled) {
      ethereum!.onAccountsChanged(
        (accounts) {
          clear();
        },
      );
      ethereum!.onChainChanged(
        (chainId) {},
      );
    }
  }
}

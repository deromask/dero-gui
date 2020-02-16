//import 'package:flutter/material.dart';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class SplashModel extends BaseModel {
  String errorMessage;
  String nextRoute;

  final WalletService _walletService = locator<WalletService>();

  // resolve wallet state to corresponding route
  Future checkAppState(WalletState walletState) async {
    print("checkAppState");
    setState(ViewState.Busy);
    // Handle potential error here too.
    print(walletState.toString());

    if (walletState.hasAddress()) {
      // wallet already opened
      nextRoute = '/home';
    } else {
      // when app start, state syncing may not happen right away, do manual check
      // do not do this outside of first started event
      // trigger sync
      _walletService.startSyncState();
      // todo check if app first started
      WalletState state = await _walletService.requestState();

      if (state.hasAddress()) {
        nextRoute = '/home';
      } else
        nextRoute = '/welcome';
    }

    setState(ViewState.Idle);
  }
}

import 'dart:async';
import 'dart:io' as io;

import 'package:dero/core/config.dart' show SYNC_INTERVAL, DEMO_ACCOUNT_NAME;
import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/services/appsettings_service.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/locator.dart';
import 'package:dero/util/utils.dart'
    show getWalletFilepath, getAllWalletInAppData, getRecoverType;
import 'package:fixnum/fixnum.dart';
import 'package:flutter/services.dart';

/// this service is responsible for manage wallet state
class WalletService {
  final DeroCore _deroCore = locator<DeroCore>();
  final AppSettingsService _appSettingsService = locator<AppSettingsService>();
  bool _isPollingState = false;
  Timer _timer;

  // provide a opened wallet state for all widgets
  StreamController<WalletState> walletStateController =
      new StreamController<WalletState>.broadcast();

  // todo: handle error
  Future requestState() async {
    WalletState state = WalletState();
    try {
      state = await _deroCore.getState(_appSettingsService.currentAppSettings);
    } on PlatformException catch (e) {
      // service alive, method fail
      print(e.toString());
    } on Exception catch (e) {
      // service died
      print(e.toString());
    }
    return state;
  }

  Future _syncState() async {
    // continuing add data to walletStateController
    const duration = const Duration(seconds: SYNC_INTERVAL);
    new Timer.periodic(duration, (Timer t) async {
      if (_timer == null) {
        _timer = t;
      }
      WalletState state = await requestState();
      walletStateController.add(state);
    });
  }

  startSyncState() {
    if (!_isPollingState) {
      _isPollingState = true;
      _syncState();
    }
  }

  stopSyncState() {
    _timer.cancel();
    _isPollingState = false;
  }

  Future recoverWallet(String filename, String password, String seed,
      {Int64 startHeight}) async {
    String filepath = await getWalletFilepath(filename);
    // get recover type
    WalletRecoverMethod type = getRecoverType(seed);

    try {
      if (type == WalletRecoverMethod.Seed) {
        await _deroCore.recoverWallet("SEED", filepath, password, seed,
            startHeight: startHeight);
      } else if (type == WalletRecoverMethod.SpendKey) {
        await _deroCore.recoverWallet("SPEND_KEY", filepath, password, seed,
            startHeight: startHeight);
      } else if (type == WalletRecoverMethod.ViewKey) {
        await _deroCore.recoverWallet("VIEW_KEY", filepath, password, seed,
            startHeight: startHeight);
      } else {
        throw Exception("no recover method for " + type.toString());
      }

      startSyncState();

      try {
        await _deroCore.setMode(true);
        // do sync right away
        WalletState initState =
            await _deroCore.getState(_appSettingsService.currentAppSettings);
        walletStateController.add(initState);
      } on Exception {
        // todo handle error
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future openWallet(String filename, String password) async {
    // filename could be a local file name or an absolute path

    String filepath = await getWalletFilepath(filename);

    try {
      if (await io.File(filepath).exists()) {
        await _deroCore.openWallet(filepath, password);
        startSyncState();

        try {
          await _deroCore.setMode(true);
          WalletState initState =
              await _deroCore.getState(_appSettingsService.currentAppSettings);
          walletStateController.add(initState);
        } on Exception catch (e) {
          throw e;
        }
      } else {
        await _deroCore.createNewWallet(filepath, password);
        startSyncState();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future rename(String filename) async {
    // filename could be a local file name or an absolute path
    //
    String filepath = await getWalletFilepath(filename);

    try {
      if (await io.File(filepath).exists()) {
        throw Exception("file exists!");
      } else {
        await _deroCore.changeName(filepath);
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<bool> logout() async {
    stopSyncState();
    bool success = false;
    try {
      await _deroCore.closeWallet();
      success = true;
    } on Exception catch (e) {
      print(e.toString());
    }

    if (success) {
      // signal wallet provider that we was logged out
      walletStateController.add(WalletState());
    } else {
      startSyncState();
    }

    return success;
  }

  /// init demo account for app store reviewer
  initDemo() async {
    var wallets = await getAllWalletInAppData();
    if (wallets == null || wallets.length == 0) {
      // create demo account
      print("create demo wallet");

      String tempFilepath = await getWalletFilepath("demo2");
      try {
        await _deroCore.createDemoWallet(tempFilepath);
        // normally we don't need to do this
        // but seem like core native still get reference to closed file
        // so we can't open it after close
        String filepath = await getWalletFilepath(DEMO_ACCOUNT_NAME);
        await io.File(tempFilepath).copy(filepath);
        await io.File(tempFilepath).delete();
      } on Exception catch (e) {
        print(e.toString());
//        throw e;
      }
    }
  }
}

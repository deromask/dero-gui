import 'dart:async';

import 'package:dero/core/models/get_transfers.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class AccountDetailSheetModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();

  GetTransfersResult _transactions;
  GetTransfersResult get transactions => _transactions;

  Future<bool> setWalletMode(bool mode) async {
    print('set mode: ' + mode.toString());

    try {
      await _deroCore.setMode(mode);
//      WalletState state = await _deroCore.getState();
//      print(state.toString() + ":mode: " + state.mode.toString());
      return true;
    } on Exception catch (e) {
      // todo log
      print(e.toString());
    }
    return false;
  }
}

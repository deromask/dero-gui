import 'dart:async';

import 'package:dero/core/models/get_transfers.pb.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class HomeModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  final WalletService _walletService = locator<WalletService>();

  GetTransfersResult _transactions;
  GetTransfersResult get transactions => _transactions;

  // todo seperate transaction list to its own view
  Future<void> getTransactions() async {
//    print("get transactions");
    try {
      _transactions = await _deroCore.getTransfers();
//      print(_transactions);
    } on Exception catch (e) {
      print(e.toString());
      _transactions = GetTransfersResult();
    }
    notifyListeners();
  }

  Future<bool> logout() async {
    return _walletService.logout();
  }

  bool canSend(WalletState ws) {
    return (ws.balance != null && ws.balance > 0 && ws.isViewOnly == false);
  }
}

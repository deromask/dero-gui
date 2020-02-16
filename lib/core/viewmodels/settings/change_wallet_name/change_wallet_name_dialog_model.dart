import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class ChangeWalletNameDialogModel extends BaseModel {
  final WalletService _walletService = locator<WalletService>();

  String errorMessage;

  Future<bool> changeWalletName(String name) async {
    setState(ViewState.Busy);
    var result = false;

    try {
      await _walletService.rename(name);
      result = true;
    } on Exception catch (e) {
      result = false;
      errorMessage = e.toString();
    }
    setState(ViewState.Idle);
    return result;
  }

  void clear() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

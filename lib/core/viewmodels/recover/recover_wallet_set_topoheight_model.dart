import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';
import 'package:fixnum/fixnum.dart';

class RecoverWalletSetTopoheightModel extends BaseModel {
  final WalletService _walletService = locator<WalletService>();
  bool _isPasswordHide = true;
  bool get isPasswordHide => _isPasswordHide;

  String errorMessage;

  Future<bool> openWallet(String filename, String password,
      WalletRecoverMethod walletRecoverMethod, String recoverData,
      {Int64 startHeight}) async {
    errorMessage = null;
    setState(ViewState.Busy);
    var success = true;

    try {
      await _walletService.recoverWallet(filename, password, recoverData,
          startHeight: startHeight);
    } on Exception catch (e) {
      success = false;
      errorMessage = e.toString();
    }

    setState(ViewState.Idle);
    return success;
  }

  clearErrorsMessage() {
    errorMessage = "";
    notifyListeners();
  }
}

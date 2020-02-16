import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class CreateWalletModel extends BaseModel {
  final WalletService _walletService = locator<WalletService>();
  bool _isPasswordHide = true;
  bool get isPasswordHide => _isPasswordHide;

  String errorMessage;

  Future<bool> createWallet(String filename, String password) async {
    errorMessage = null;
    setState(ViewState.Busy);
    var success = true;

    try {
      await _walletService.openWallet(filename, password);
      success = true;
    } on Exception catch (e) {
      success = false;
      errorMessage = e.toString();
    }

    setState(ViewState.Idle);
    return success;
  }

  // todo make it own view
  showHidePassword() {
    _isPasswordHide = !_isPasswordHide;
    notifyListeners();
  }
}

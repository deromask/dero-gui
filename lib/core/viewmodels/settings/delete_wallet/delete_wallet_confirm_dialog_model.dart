import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class DeleteWalletConfirmDialogModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();

  BoolResult checkPasswordResult;
  String errorMessage;

  Future<bool> deleteWallet(String password) async {
    setState(ViewState.Busy);
    var result = false;

    try {
      checkPasswordResult = await _deroCore.checkPassword(password);
      if (!checkPasswordResult.result) {
        throw new Exception("invalid password");
      }

      await _deroCore.deleteWallet();
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

//import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/tx_info.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class SendConfirmSheetModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  String errorMessage;

  // relay tx
  Future<bool> send(TxInfo txInfo) async {
    setState(ViewState.Busy);
    var success = false;

    try {
      await _deroCore.relayTx(txInfo);
      success = true;
      errorMessage = "";
    } on Exception catch (e) {
      success = false;
      errorMessage = e.toString();
    }
    setState(ViewState.Idle);
    return success;
  }

  void clearErrorMessage() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/models/tx_info.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class SendAmountSheetModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  bool isMax = false;
  String errorMessage;
  TxInfo txInfo;

  Future<bool> canSend(String address, String amount,
      {String paymentID}) async {
    errorMessage = null;
    setState(ViewState.Busy);
    var success = false;

    try {
      BoolResult validateAddressResult =
          await _deroCore.validateAddress(address);
      if (!validateAddressResult.result) {
        throw Exception("Invalid address");
      }
      if (!isMax) {
        txInfo =
            await _deroCore.createTx(address, amount, paymentID: paymentID);
      } else {
        txInfo = await _deroCore.createTxMax(address, paymentID: paymentID);
      }
      success = true;
    } on Exception catch (e) {
      success = false;
      errorMessage = e.toString();
    }
//    print("txInfo:");
//    print(txInfo);
    setState(ViewState.Idle);
    return success;
  }

  setMax({bool val}) {
    if (val != null) {
      isMax = val;
    } else {
      isMax = !isMax;
    }
    notifyListeners();
  }

  void clearErrors() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

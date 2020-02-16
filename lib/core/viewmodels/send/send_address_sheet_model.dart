import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class SendAddressSheetModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  String errorMessage;

  Future<bool> validateInput(String address, {String paymentID}) async {
    errorMessage = null;
    setState(ViewState.Busy);
    var success = false;

    if (address == null) {
      errorMessage = "Invalid address";
    }

    if (paymentID != null &&
        paymentID != "" &&
        paymentID.length != 16 &&
        paymentID.length != 64) {
      errorMessage = "Invalid payment id";
    }

    try {
      BoolResult validateAddressResult =
          await _deroCore.validateAddress(address);
      if (!validateAddressResult.result) {
        throw Exception("Invalid address");
      }
    } on Exception catch (e) {
      print(e.toString());
      errorMessage = e.toString();
    }
    setState(ViewState.Idle);

    if (errorMessage == null || errorMessage == "") {
      success = true;
    }

    return success;
  }

  void clearErrors() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

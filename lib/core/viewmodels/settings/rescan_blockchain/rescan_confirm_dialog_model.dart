import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/rescan.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';
import 'package:fixnum/fixnum.dart';

class RescanConfirmDialogModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();

  RescanResult rescanResult;
  String errorMessage;

  Future<bool> rescan(String height) async {
    setState(ViewState.Busy);

    if (height == null && height == "") {
      errorMessage = "start height is required";
    } else {
      try {
        Int64 startHeight = Int64.parseInt(height);
        try {
          rescanResult = await _deroCore.rescanBlockchain(startHeight);
        } on Exception catch (e) {
          throw e;
        }
      } on Exception catch (e) {
        errorMessage = e.toString();
      }
    }

    setState(ViewState.Idle);
    print(errorMessage);
    return errorMessage == null || errorMessage == "";
  }

  void onTextFieldChange(text) {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

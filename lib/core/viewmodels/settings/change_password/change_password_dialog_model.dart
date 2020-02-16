import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class ChangePasswordDialogModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  String errorMessage;

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    setState(ViewState.Busy);

    if (oldPassword == null && oldPassword == "") {
      errorMessage = "field is empty";
    } else {
      try {
        BoolResult checkPasswordResult =
            await _deroCore.checkPassword(oldPassword);
        if (!checkPasswordResult.result) {
          throw Exception('invalid password');
        }

        await _deroCore.changePassword(newPassword);
      } on Exception catch (e) {
        errorMessage = e.toString();
      }
    }

    setState(ViewState.Idle);
    return errorMessage == null || errorMessage == "";
  }

  void clear() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

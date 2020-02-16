import 'dart:async';

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/services/appsettings_service.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';
//import 'package:dero/core/models/set_daemon_address.pb.dart';

class ChangeDaemonConfirmDialogModel extends BaseModel {
  final DeroCore _deroCore = locator<DeroCore>();
  final AppSettingsService _appStateService = locator<AppSettingsService>();

  String errorMessage;

  Future<bool> changeDaemon(String address) async {
    setState(ViewState.Busy);

    if (address == null && address == "") {
      errorMessage = "field is empty";
    } else {
      try {
        _appStateService.setDaemonAddress(address);
        await _deroCore.setDaemonAddress(address);
      } on Exception catch (e) {
        errorMessage = e.toString();
      }
    }

    setState(ViewState.Idle);
//    print(errorMessage);
    return errorMessage == null || errorMessage == "";
  }

  void onTextFieldChange(text) {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

//import 'dart:async';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/services/contacts_service.dart';
import 'package:dero/core/services/derocore.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class AddContactModel extends BaseModel {
  final ContactsService _contactService = locator<ContactsService>();
  final DeroCore _deroCore = locator<DeroCore>();

  String errorMessage;

  Future<bool> addContact(String name, String address) async {
    errorMessage = null;
    setState(ViewState.Busy);
    var success = false;

    try {
      BoolResult result = await _deroCore.validateAddress(address);
      if (result.result == false) {
        throw Exception("invalid address");
      }
      success = _contactService.addContact(name, address);
    } on Exception catch (e) {
      success = false;
      errorMessage = e.toString();
      print(errorMessage);
    }

    setState(ViewState.Idle);
    return success;
  }

  void clearErrorMessages() {
    // clear error message while typing
    errorMessage = "";
    notifyListeners();
  }
}

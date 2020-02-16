//import 'dart:async';
import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/contacts.pb.dart';
import 'package:dero/core/services/contacts_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class ContactDetailsModel extends BaseModel {
  final ContactsService _contactService = locator<ContactsService>();

  String errorMessage;

  bool removeContact(Contact contact) {
    setState(ViewState.Busy);
    var success = false;

    try {
      success = _contactService.removeContact(contact);
    } on Exception catch (e) {
      success = false;
      errorMessage = e.toString();
    }

    setState(ViewState.Idle);
    return success;
  }
}

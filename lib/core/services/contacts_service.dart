import 'dart:async';

import 'package:dero/core/config.dart'
    show CONTACTS_STORAGE_KEY, DONATION_ADDRESS;
import 'package:dero/core/models/contacts.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The service responsible for get and set contacts
class ContactsService {
  // singleton
  static SharedPreferences _preferences;
  static ContactsService _instance;

  // keys
  static const String _key = CONTACTS_STORAGE_KEY;

  static Future<ContactsService> getInstance() async {
    if (_instance == null) {
      _instance = ContactsService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    // init instance with saved or default data
    _instance.init();

    return _instance;
  }

  StreamController<List<Contact>> contactsController =
      new StreamController<List<Contact>>.broadcast();

  Contacts _currentContacts;

  Contacts get currentContacts => _currentContacts;

  bool _initialized = false;

  // init instance with saved or default data
  void init() {
    if (!_initialized) {
      _get();
      _initialized = true;
    }
  }

  static Contacts getDefault() {
    Contacts defaultContacts = Contacts();
    Contact donation = Contact();
    donation.address = DONATION_ADDRESS;
    donation.name = "@DeroMaskDonations";
    defaultContacts.contacts.add(donation);
    return defaultContacts;
  }

  bool addContact(String name, String address) {
    if (_currentContacts == null) {
      return false;
    }

    Contact contact = Contact();
    contact.name = name;
    contact.address = address;

    _currentContacts.contacts.add(contact);
    contactsController.add(_currentContacts.contacts);
    _save();
    return true;
  }

  bool removeContact(Contact contact) {
    if (_currentContacts == null) {
      return false;
    }

    _currentContacts.contacts.remove(contact);
    _save();
    return true;
  }

  _save() {
    contactsController.add(_currentContacts.contacts);
    _preferences.setString(_key, _currentContacts.writeToJson());
  }

  _get() {
    try {
      String savedData = _preferences.getString(_key);
      if (savedData == null || savedData == "") {
        // first time
        _currentContacts = getDefault();
        _save();
      } else {
        _currentContacts = Contacts.fromJson(savedData);
      }
    } on Exception catch (e) {
      print(e.toString());
      _currentContacts = getDefault();
      _save();
    }
  }
}

import 'dart:async';

import 'package:dero/core/config.dart'
    show DEFAULT_REMOTE_DAEMON, APP_SETTINGS_STORAGE_KEY;
import 'package:dero/core/models/appsettings.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The service responsible for get and set app settings
class AppSettingsService {
  // singleton
  static SharedPreferences _preferences;
  static AppSettingsService _instance;

  // keys
  static const String _key = APP_SETTINGS_STORAGE_KEY;

  static Future<AppSettingsService> getInstance() async {
    if (_instance == null) {
      _instance = AppSettingsService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    // init instance with saved or default data
    _instance.init();

    return _instance;
  }

  StreamController<AppSettings> appStateController =
      new StreamController<AppSettings>.broadcast();

  static AppSettings getDefault() {
    AppSettings defaultAppSettings = AppSettings();
    defaultAppSettings.daemonAddress = DEFAULT_REMOTE_DAEMON;
    return defaultAppSettings;
  }

  AppSettings _currentAppSettings;

  AppSettings get currentAppSettings => _currentAppSettings;

  bool _initialized = false;

  // init instance with saved or default data
  void init() {
    if (!_initialized) {
      _getAppSettings();
      _initialized = true;
    }
  }

  bool setDaemonAddress(String address) {
    if (_currentAppSettings == null) {
      return false;
    }
    _currentAppSettings.daemonAddress = address;
    _saveAppSettings();
    return true;
  }

  String getDaemonAddress() {
    if (_currentAppSettings == null) {
      return null;
    }
    return _currentAppSettings.daemonAddress;
  }

  bool setTheme(String theme) {
    print("set theme: " + theme);
    if (_currentAppSettings == null) {
      return false;
    }
    _currentAppSettings.theme = theme;
    _saveAppSettings();
    return true;
  }

  String getTheme() {
    if (_currentAppSettings == null) {
      return null;
    }
    return _currentAppSettings.theme;
  }

  _saveAppSettings() {
    appStateController.add(_currentAppSettings);
    _preferences.setString(_key, _currentAppSettings.writeToJson());
  }

  _getAppSettings() {
    try {
      String savedData = _preferences.getString(_key);
      if (savedData == null || savedData == "") {
        print("app settings: none");
        // first time
        _currentAppSettings = getDefault();
        _saveAppSettings();
      } else {
        print("app settings: " + savedData);
        _currentAppSettings = AppSettings.fromJson(savedData);
      }
    } on Exception catch (e) {
      print(e.toString());
      _currentAppSettings = getDefault();
      _saveAppSettings();
    }
  }
}

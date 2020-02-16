import 'dart:convert';

import 'package:dero/core/config.dart' show BUILD_CODE, UPDATE_API;
import 'package:dero/core/models/app_update_info.dart';
import 'package:http/http.dart' as http;

/// The service responsible for check update
class AppUpdateService {
  // singleton
  static AppUpdateService _instance;

  static AppUpdateService getInstance() {
    if (_instance == null) {
      _instance = AppUpdateService();
    }

    return _instance;
  }

  AppUpdateInfo _appUpdateInfo;
  AppUpdateInfo get appUpdateInfo => _appUpdateInfo;

  Future<bool> isUptodate() async {
    // package_info doesnt work on desktop
//    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (_appUpdateInfo == null || _appUpdateInfo.versionCode == null) {
      return null;
    }

//    int versionCode = int.parse(packageInfo.buildNumber);
    if (BUILD_CODE == _appUpdateInfo.versionCode) {
      return true;
    }

    return false;
  }

  Future fetch() async {
    try {
      final response = await http.get(UPDATE_API);

      if (response.statusCode == 200) {
        _appUpdateInfo = AppUpdateInfo.fromJson(jsonDecode(response.body));
        print(_appUpdateInfo.toString());
        print("latest update: " +
            _appUpdateInfo.versionName +
            " " +
            _appUpdateInfo.versionCode.toString());
      }
      print("update info fetched");
    } on Exception {}
  }
}

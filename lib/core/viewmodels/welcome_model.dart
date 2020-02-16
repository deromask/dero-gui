import 'dart:async';

import 'package:dero/core/services/app_update_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';

class WelcomeModel extends BaseModel {
  final AppUpdateService _appUpdateService = locator<AppUpdateService>();

  Future<bool> checkUpdate() async {
    bool result = await _appUpdateService.isUptodate();
    return result;
  }
}

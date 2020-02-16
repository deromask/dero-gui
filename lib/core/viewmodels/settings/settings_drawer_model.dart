import 'dart:async';

import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDrawerModel extends BaseModel {
  final WalletService _walletService = locator<WalletService>();
//  bool _isPasswordHide = true;
//  bool get isPasswordHide => _isPasswordHide;

//  String errorMessage;

  Future<bool> onBackButtonPressed() async {
    return true;
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> logout() async {
    print("logging out");
    return _walletService.logout();
  }
}

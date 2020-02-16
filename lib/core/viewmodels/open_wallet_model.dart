import 'dart:async';
import 'dart:io' show Platform, File;

import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/services/wallet_service.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/locator.dart';
import 'package:dero/util/utils.dart'
    show getAllWalletInAppData, copyWalletFileToAppData;
import 'package:file_picker/file_picker.dart';
import 'package:fixnum/fixnum.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenWalletModel extends BaseModel {
  final WalletService _walletService = locator<WalletService>();
  bool _isPasswordHide = true;

  bool get isPasswordHide => _isPasswordHide;

  List<String> _wallets = [];

  List<String> get wallets => _wallets;

  String errorMessage;

  Future<bool> openWallet(String filename, String password,
      {String seed = "", Int64 startHeight}) async {
    errorMessage = null;
    setState(ViewState.Busy);

    try {
      await _walletService.openWallet(filename, password);
    } on Exception catch (e) {
      errorMessage = e.toString();
    }

    setState(ViewState.Idle);
    return errorMessage == null || errorMessage == "";
  }

  importWalletFile() async {
    bool hasPermission = false;

    if (Platform.isIOS || Platform.isAndroid) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);

      if (permission == PermissionStatus.denied) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);

        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          hasPermission = true;
        }
      } else {
        hasPermission = true;
      }
    } else
      hasPermission = true;

    if (hasPermission)
      try {
        File file = await FilePicker.getFile();
        // @todo check for conflict
        // copy file to app's data
        if (file != null && await file.exists()) {
          await copyWalletFileToAppData(file);
          // notify new wallet
          await getWallets();
        }
      } on Exception catch (e) {
        print(e.toString());
      }
    else
      print("no permisson to write file");
  }

  importWalletFile2() async {
    try {
      File file = await FilePicker.getFile();
      // @todo check for conflict
      // copy file to app's data
      print(file.toString());
      if (file != null && await file.exists()) {
        await copyWalletFileToAppData(file);
        await getWallets();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  // todo make its own view
  showHidePassword() {
    _isPasswordHide = !_isPasswordHide;
    notifyListeners();
  }

  // todo make its own view
  getWallets() async {
    _wallets = await getAllWalletInAppData();
//    print(_wallets);
    notifyListeners();
  }
}

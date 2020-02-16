import 'package:dero/core/enums/wallet_backup_method.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_extend/share_extend.dart';
import 'dart:io' show Platform;

class BackupSeedSheetModel extends BaseModel {
  WalletBackupMethod backupMethod;
  String backupTextTitle;

//  String get showWhat => _showWhat;

  changeBackupMethod(WalletState ws) {
    if (ws.isViewOnly) {
      backupMethod = WalletBackupMethod.ViewKey;
      backupTextTitle = "View Key";
    } else {
      if (backupMethod == null) {
        backupMethod = WalletBackupMethod.Seed;
        backupTextTitle = "Seed";
      } else if (backupMethod == WalletBackupMethod.Seed) {
        backupMethod = WalletBackupMethod.SpendKey;
        backupTextTitle = "Private Key";
      } else if (backupMethod == WalletBackupMethod.SpendKey) {
        backupMethod = WalletBackupMethod.ViewKey;
        backupTextTitle = "View Key";
      } else if (backupMethod == WalletBackupMethod.ViewKey) {
        backupMethod = WalletBackupMethod.File;
        backupTextTitle = "Wallet File";
      } else if (backupMethod == WalletBackupMethod.File) {
        backupMethod = WalletBackupMethod.Seed;
        backupTextTitle = "Seed";
      }
    }
    notifyListeners();
  }

  shareWalletFile(String path) async {

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
    } else hasPermission = true;

    if (hasPermission)
      try {
        ShareExtend.share(path, "file");
      } on Exception catch (e) {
        print(e.toString());
      }
    else
      print("no permisson to write file");
  }

  String copyBackupText(WalletState ws) {
    switch (backupMethod) {
      case WalletBackupMethod.Seed:
        {
          return ws.seed;
        }
        break;
      case WalletBackupMethod.SpendKey:
        {
          return ws.spendKey;
        }
        break;
      case WalletBackupMethod.ViewKey:
        {
          return ws.viewKey;
        }
        break;
      default:
        {
          return null;
        }
        break;
    }
  }
}

import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:dero/core/viewmodels/base_model.dart';

class RecoverWalletImportSeedModel extends BaseModel {
  String recoverText = ""; // seed, key, file path
  String header = "Import Seed";
  String hint =
      "Please enter your 25-words secret phrase below. Each word shoud be separated by a space.";
  WalletRecoverMethod walletRecoverMethod = WalletRecoverMethod.Seed;
  bool validInput = true; // @todo set to false in production
  String errorMessage;

//  String get showWhat => _showWhat;

  changeRecoverType() {
    if (walletRecoverMethod == WalletRecoverMethod.Seed) {
      walletRecoverMethod = WalletRecoverMethod.SpendKey;
      header = "Import Private Key";
      hint = "Please enter your private spend key below.";
    } else if (walletRecoverMethod == WalletRecoverMethod.SpendKey) {
      walletRecoverMethod = WalletRecoverMethod.ViewKey;
      header = "Import View Key";
      hint = "Please enter your view key below.";
    } else if (walletRecoverMethod == WalletRecoverMethod.ViewKey) {
//      walletRecoverMethod = WalletRecoverMethod.File;
//      header = "Import File";
//      hint = "Select file from storage.";
//    } else if (walletRecoverMethod == WalletRecoverMethod.File) {
      walletRecoverMethod = WalletRecoverMethod.Seed;
      header = "Import Seed";
      hint =
          "Please enter your 25-words secret phrase below. Each word shoud be separated by a space.";
    }
    notifyListeners();
  }

  setRecoverText(String s) {
    recoverText = s;
    notifyListeners();
  }

  bool validateRecoverData() {
    errorMessage = null;
    var testData = recoverText.trim();

    if (walletRecoverMethod == WalletRecoverMethod.Seed) {
      if (testData.split(" ").length != 25) {
        errorMessage =
            "Invalid seed. Seed must be 25-words seperated by a space\n" +
                "words count: " +
                testData.split(" ").length.toString();
      }
    } else if (walletRecoverMethod == WalletRecoverMethod.SpendKey) {
      if (testData.length != 64) {
        errorMessage =
            "Invalid private key. Private key must be a 64 alphabet characters\n" +
                "input length: " +
                recoverText.length.toString();
      }
    } else if (walletRecoverMethod == WalletRecoverMethod.ViewKey) {
      if (testData.length != 128) {
        errorMessage =
            "Invalid view key. Private key must be a 128 alphabet characters\n" +
                "input length: " +
                recoverText.length.toString();
      }
    }

    if (errorMessage != null && errorMessage != "") {
      return false;
    }
    return true;
  }

  clearErrorsMessage() {
    errorMessage = "";
    notifyListeners();
  }
}

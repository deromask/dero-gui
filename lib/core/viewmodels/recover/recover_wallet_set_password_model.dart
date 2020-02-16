import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/util/utils.dart';

class RecoverWalletSetPasswordModel extends BaseModel {
  bool validInput = true; // todo set to false in production
  String errorMessage;

  Future<bool> validateInput(String filename, String password) async {
    errorMessage = null;

    if (filename == null || filename == "") {
      errorMessage = "wallet name must be set";
    } else {
      var walletExists = await checkWalletExists(filename);
      if (walletExists) {
        errorMessage = "wallet is exists";
      }
    }
    if (password == null || password == "") {
      errorMessage = "password must be set";
    }
    if ((filename == null || filename == "") &&
        (password == null || password == "")) {
      errorMessage = "wallet name and password must be set";
    }

    notifyListeners();

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

import 'package:dero/core/enums/wallet_recover_method.dart';

class SetTopoheightArguments {
  final WalletRecoverMethod walletRecoverMethod;
  final String recoverData;
  final String filename;
  final String password;

  SetTopoheightArguments(
      this.walletRecoverMethod, this.recoverData, this.filename, this.password);
}

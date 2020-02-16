import 'package:dero/core/enums/wallet_recover_method.dart';

class SetPasswordArguments {
  final WalletRecoverMethod walletRecoverMethod;
  final String recoverData;

  SetPasswordArguments(this.walletRecoverMethod, this.recoverData);
}

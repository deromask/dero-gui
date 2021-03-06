//import 'package:dero/core/config.dart';
import 'dart:async';
import 'dart:typed_data' show Uint8List;

import 'package:dero/core/models/appsettings.pb.dart';
import 'package:dero/core/models/bool_result.pb.dart';
import 'package:dero/core/models/change_name.pb.dart';
import 'package:dero/core/models/change_password.pb.dart';
import 'package:dero/core/models/check_password.pb.dart';
import 'package:dero/core/models/close_wallet.pb.dart';
import 'package:dero/core/models/create_demo_wallet.pb.dart';
import 'package:dero/core/models/create_new_wallet.pb.dart';
import 'package:dero/core/models/delete_wallet.pb.dart';
import 'package:dero/core/models/destination.pb.dart';
import 'package:dero/core/models/get_max_send.pb.dart';
import 'package:dero/core/models/get_seed.pb.dart';
import 'package:dero/core/models/get_transfer_fee.pb.dart';
import 'package:dero/core/models/get_transfers.pb.dart';
import 'package:dero/core/models/open_wallet.pb.dart';
import 'package:dero/core/models/recover_wallet.pb.dart';
import 'package:dero/core/models/rescan.pb.dart';
import 'package:dero/core/models/set_daemon_address.pb.dart';
import 'package:dero/core/models/set_mode.pb.dart';
import 'package:dero/core/models/transfers.pb.dart';
import 'package:dero/core/models/transfers_everything.pb.dart';
import 'package:dero/core/models/tx_info.pb.dart';
import 'package:dero/core/models/validate_address.pb.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/services.dart';

/// The service responsible for calling api exposed by derocore native generated by gomobile bind
/// by default method that only return true doesn't return anything
/// if error occur, throw it via platform exception
class DeroCore {
  static const _channel = const MethodChannel('io.deromask.deromob');

  Future createNewWallet(String filepath, String password) async {
    print("create wallet: " + filepath);
    try {
      var arguments = Map();
      arguments['method'] = "create_new_wallet";

      CreateNewWalletParam params = CreateNewWalletParam();
      params.filename = filepath;
      params.password = password;

      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future recoverWallet(
      String type, String filepath, String password, String seed,
      {Int64 startHeight}) async {
    try {
      var arguments = Map();
      arguments['method'] = "recover_wallet";

      RecoverWalletParam params = RecoverWalletParam();
      params.filename = filepath;
      params.password = password;
      params.data = seed;
      params.type = type;

      if (startHeight != null) {
        params.startHeight = startHeight;
      }

      arguments['args'] = params.writeToBuffer();
      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future createDemoWallet(String filepath) async {
    try {
      var arguments = Map();
      arguments['method'] = "create_demo_wallet";

      CreateDemoWalletParam params = CreateDemoWalletParam();
      params.filepath = filepath;

      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future openWallet(String filepath, String password) async {
    try {
      var arguments = Map();
      arguments['method'] = "open_wallet";

      OpenWalletParam params = OpenWalletParam();
      params.filename = filepath;
      params.password = password;

      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future setDaemonAddress(String address) async {
    try {
      var arguments = Map();
      arguments['method'] = "set_daemon_address";

      SetDaemonAddressParam params = SetDaemonAddressParam();
      params.address = address;

      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future setMode(bool mode) async {
    try {
      var arguments = Map();
      arguments['method'] = "set_mode";

      SetModeParam params = SetModeParam();
      params.mode = mode;
      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future rescanBlockchain(Int64 height) async {
    try {
      var arguments = Map();
      arguments['method'] = "rescan_blockchain";

      RescanParam params = RescanParam();
      params.height = height;
      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future relayTx(TxInfo txInfo) async {
    try {
      var arguments = Map();
      arguments['method'] = "relay_tx";
      arguments['args'] = txInfo.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future deleteWallet() async {
    try {
      var arguments = Map();
      arguments['method'] = "delete";

      DeleteWalletParam params = DeleteWalletParam();
      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future changeName(String filepath) async {
    try {
      var arguments = Map();
      arguments['method'] = "change_name";

      ChangeNameParam params = ChangeNameParam();
      params.filepath = filepath;
      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future changePassword(String password) async {
    try {
      var arguments = Map();
      arguments['method'] = "change_password";

      ChangePasswordParam params = ChangePasswordParam();
      params.password = password;
      arguments['args'] = params.writeToBuffer();

      await _channel.invokeMethod('call_native', arguments);
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<BoolResult> checkPassword(String password) async {
    try {
      var arguments = Map();
      arguments['method'] = "check_password";

      CheckPasswordParam params = CheckPasswordParam();
      params.password = password;
      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("call_native error");
      }

      final BoolResult result = BoolResult.fromBuffer(rawData);

      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<BoolResult> validateAddress(String address) async {
    try {
      var arguments = Map();
      arguments['method'] = "validate_address";

      ValidateAddressParam params = ValidateAddressParam();
      params.address = address;
      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("call_native error");
      }

      final BoolResult result = BoolResult.fromBuffer(rawData);

      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<WalletState> getState(AppSettings appSettings) async {
    try {
      var arguments = Map();
      arguments['method'] = "get_state";

      WalletStateParam params = WalletStateParam();
      params.appSettings = appSettings;
      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("no state");
      }

      final WalletState result = WalletState.fromBuffer(rawData);

      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<GetMaxSendResult> getMaxSend() async {
    try {
      var arguments = Map();
      arguments['method'] = "get_max_send";

      GetMaxSendParam params = GetMaxSendParam();
      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("call_native_fail");
      }

      final GetMaxSendResult result = GetMaxSendResult.fromBuffer(rawData);

      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<GetTransfersResult> getTransfers() async {
    try {
      var arguments = Map();
      arguments['method'] = "get_transfers";

      GetTransfersParam params = GetTransfersParam();
      params.in_1 = true;
      params.out = true;
      params.pending = false;
      params.failed = false;
      params.pool = false;
      params.filterByHeight = false;
      params.minHeight = new Int64(0);
      params.maxHeight = new Int64(0);

      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("no transactions found");
      }

      final GetTransfersResult result = GetTransfersResult.fromBuffer(rawData);
      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<GetTransferFeeResult> getTransferFee() async {
    try {
      var arguments = Map();
      arguments['method'] = "get_transfer_fee";

      GetTransferFeeParam params = GetTransferFeeParam();

      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("No response from service");
      }

      final GetTransferFeeResult result =
          GetTransferFeeResult.fromBuffer(rawData);
      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<TxInfo> createTxs(List<Destination> destinations,
      {String paymentID}) async {
    try {
      var arguments = Map();
      arguments['method'] = "create_tx";

      TransfersParam params = TransfersParam();
      params.destinations.addAll(destinations);
      if (paymentID != null || paymentID != "") params.paymentId = paymentID;

      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("No response from service");
      }

      final TxInfo result = TxInfo.fromBuffer(rawData);
      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<TxInfo> createTxMax(String address, {String paymentID = ""}) async {
    if (paymentID == null) {
      paymentID = "";
    }
    print("create transfer everything tx");
    try {
      var arguments = Map();
      arguments['method'] = "create_tx_max";

      TransfersEverythingParam params = TransfersEverythingParam();
      params.address = address;
      if (paymentID != null || paymentID != "") params.paymentId = paymentID;

      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("No response from service");
      }

      final TxInfo result = TxInfo.fromBuffer(rawData);
      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<TxInfo> createTx(String address, String amount,
      {String paymentID = ""}) async {
    Destination destination = Destination();
    destination.address = address;
    destination.humanAmount = amount;
    if (paymentID == null) {
      paymentID = "";
    }

    return createTxs([destination], paymentID: paymentID);
  }

  Future<GetSeedResult> getSeed() async {
    try {
      var arguments = Map();
      arguments['method'] = "get_seed";

      GetSeedParam params = GetSeedParam();
      params.lang = 'english';

      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("no response from native");
      }

      final GetSeedResult result = GetSeedResult.fromBuffer(rawData);
      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<CloseWalletResult> closeWallet() async {
    try {
      var arguments = Map();
      arguments['method'] = "close";
      CloseWalletParam params = CloseWalletParam();
      arguments['args'] = params.writeToBuffer();

      final Uint8List rawData =
          await _channel.invokeMethod('call_native', arguments);

      if (rawData == null) {
        throw Exception("no response from native");
      }

      final CloseWalletResult result = CloseWalletResult.fromBuffer(rawData);

      return result;
    } on PlatformException catch (e) {
      throw e;
    }
  }
}

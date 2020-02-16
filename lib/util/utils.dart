import 'dart:async';
import 'dart:io' as io;

import 'package:dero/core/config.dart' show WALLET_FILE_EXTENSION;
import 'package:dero/core/enums/wallet_recover_method.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

String _getFileExtension(String filename) {
  String ext = filename.split(".").last;
  if (ext != filename) {
    return ext;
  } else
    return "";
}

String getWalletFilename(String filepath) {
  io.File file = new io.File(filepath);
  return p.basenameWithoutExtension(file.path);
}

Future<String> getWalletFilepath(String filename) async {
  final appData = await getApplicationDocumentsDirectory();
  String filenameWithExtension = filename + "." + WALLET_FILE_EXTENSION;
  return p.join(appData.path, filenameWithExtension);
}

Future<bool> checkWalletExists(String filename) async {
  final filepath = await getWalletFilepath(filename);
  final file = io.File(filepath);
  return await file.exists();
}

Future<io.File> copyWalletFileToAppData(io.File file) async {
  String filename = getWalletFilename(file.path);
  String newFilePath = await getWalletFilepath(filename);
  return file.copy(newFilePath);
}
// return list of wallet file in app data in form of filename without extension
Future<List<String>> getAllWalletInAppData() async {
  List<String> result = [];
  final appData = await getApplicationDocumentsDirectory();
  List<io.FileSystemEntity> files = appData.listSync(recursive: false);
  for (final f in files) {
    if (f is io.File && _getFileExtension(f.path) == WALLET_FILE_EXTENSION) {
      result.add(getWalletFilename(f.absolute.toString()));
    }
  }
  print(result);
  return result;
}

Future waitAfter(int numberOfMilliSeconds) async {
  await Future.delayed(Duration(milliseconds: numberOfMilliSeconds));
}

Future<io.Directory> getExternalDirectory() async {
  return await getExternalStorageDirectory();
}

/// detect wallet recover type from string t
WalletRecoverMethod getRecoverType(String t) {
  // first remove all first and last space
  var trimmed = t.trim();
  var splited = trimmed.split(" ");

  // t might be a private key
  if (trimmed.length == 64 && splited.length == 1) {
    return WalletRecoverMethod.SpendKey;
  }

  if (trimmed.length == 128 && splited.length == 1) {
    return WalletRecoverMethod.ViewKey;
  }

  // otherwise it might be a seed
  return WalletRecoverMethod.Seed;
}

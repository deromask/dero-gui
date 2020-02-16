///
//  Generated code. Do not modify.
//  source: wallet_state.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'appsettings.pb.dart' as $2;

class WalletStateParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WalletStateParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOM<$2.AppSettings>(1, 'appSettings', subBuilder: $2.AppSettings.create)
    ..hasRequiredFields = false
  ;

  WalletStateParam._() : super();
  factory WalletStateParam() => create();
  factory WalletStateParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WalletStateParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WalletStateParam clone() => WalletStateParam()..mergeFromMessage(this);
  WalletStateParam copyWith(void Function(WalletStateParam) updates) => super.copyWith((message) => updates(message as WalletStateParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WalletStateParam create() => WalletStateParam._();
  WalletStateParam createEmptyInstance() => create();
  static $pb.PbList<WalletStateParam> createRepeated() => $pb.PbList<WalletStateParam>();
  @$core.pragma('dart2js:noInline')
  static WalletStateParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WalletStateParam>(create);
  static WalletStateParam _defaultInstance;

  @$pb.TagNumber(1)
  $2.AppSettings get appSettings => $_getN(0);
  @$pb.TagNumber(1)
  set appSettings($2.AppSettings v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAppSettings() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppSettings() => clearField(1);
  @$pb.TagNumber(1)
  $2.AppSettings ensureAppSettings() => $_ensure(0);
}

class WalletState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WalletState', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'mode')
    ..aOS(2, 'address')
    ..a<$fixnum.Int64>(3, 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(4, 'topoHeight')
    ..aOS(5, 'daemonAddress')
    ..a<$fixnum.Int64>(6, 'daemonHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(7, 'daemonTopoHeight')
    ..a<$fixnum.Int64>(8, 'matureBalance', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(9, 'lockedBalance', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(10, 'balance', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(11, 'price', $pb.PbFieldType.OD)
    ..aOS(12, 'walletPath')
    ..aOS(13, 'seed')
    ..aOS(14, 'spendKey')
    ..aOS(15, 'viewKey')
    ..aOB(16, 'isViewOnly')
    ..a<$fixnum.Int64>(17, 'txFee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  WalletState._() : super();
  factory WalletState() => create();
  factory WalletState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WalletState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WalletState clone() => WalletState()..mergeFromMessage(this);
  WalletState copyWith(void Function(WalletState) updates) => super.copyWith((message) => updates(message as WalletState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WalletState create() => WalletState._();
  WalletState createEmptyInstance() => create();
  static $pb.PbList<WalletState> createRepeated() => $pb.PbList<WalletState>();
  @$core.pragma('dart2js:noInline')
  static WalletState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WalletState>(create);
  static WalletState _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get mode => $_getBF(0);
  @$pb.TagNumber(1)
  set mode($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get topoHeight => $_getI64(3);
  @$pb.TagNumber(4)
  set topoHeight($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTopoHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearTopoHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get daemonAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set daemonAddress($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDaemonAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearDaemonAddress() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get daemonHeight => $_getI64(5);
  @$pb.TagNumber(6)
  set daemonHeight($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDaemonHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearDaemonHeight() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get daemonTopoHeight => $_getI64(6);
  @$pb.TagNumber(7)
  set daemonTopoHeight($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDaemonTopoHeight() => $_has(6);
  @$pb.TagNumber(7)
  void clearDaemonTopoHeight() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get matureBalance => $_getI64(7);
  @$pb.TagNumber(8)
  set matureBalance($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMatureBalance() => $_has(7);
  @$pb.TagNumber(8)
  void clearMatureBalance() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get lockedBalance => $_getI64(8);
  @$pb.TagNumber(9)
  set lockedBalance($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLockedBalance() => $_has(8);
  @$pb.TagNumber(9)
  void clearLockedBalance() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get balance => $_getI64(9);
  @$pb.TagNumber(10)
  set balance($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBalance() => $_has(9);
  @$pb.TagNumber(10)
  void clearBalance() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get price => $_getN(10);
  @$pb.TagNumber(11)
  set price($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get walletPath => $_getSZ(11);
  @$pb.TagNumber(12)
  set walletPath($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasWalletPath() => $_has(11);
  @$pb.TagNumber(12)
  void clearWalletPath() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get seed => $_getSZ(12);
  @$pb.TagNumber(13)
  set seed($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSeed() => $_has(12);
  @$pb.TagNumber(13)
  void clearSeed() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get spendKey => $_getSZ(13);
  @$pb.TagNumber(14)
  set spendKey($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSpendKey() => $_has(13);
  @$pb.TagNumber(14)
  void clearSpendKey() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get viewKey => $_getSZ(14);
  @$pb.TagNumber(15)
  set viewKey($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasViewKey() => $_has(14);
  @$pb.TagNumber(15)
  void clearViewKey() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get isViewOnly => $_getBF(15);
  @$pb.TagNumber(16)
  set isViewOnly($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasIsViewOnly() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsViewOnly() => clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get txFee => $_getI64(16);
  @$pb.TagNumber(17)
  set txFee($fixnum.Int64 v) { $_setInt64(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasTxFee() => $_has(16);
  @$pb.TagNumber(17)
  void clearTxFee() => clearField(17);
}


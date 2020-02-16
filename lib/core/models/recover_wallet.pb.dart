///
//  Generated code. Do not modify.
//  source: recover_wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RecoverWalletParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RecoverWalletParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'type')
    ..aOS(2, 'filename')
    ..aOS(3, 'password')
    ..aOS(4, 'data')
    ..aInt64(5, 'startHeight', protoName: 'startHeight')
    ..hasRequiredFields = false
  ;

  RecoverWalletParam._() : super();
  factory RecoverWalletParam() => create();
  factory RecoverWalletParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecoverWalletParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RecoverWalletParam clone() => RecoverWalletParam()..mergeFromMessage(this);
  RecoverWalletParam copyWith(void Function(RecoverWalletParam) updates) => super.copyWith((message) => updates(message as RecoverWalletParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecoverWalletParam create() => RecoverWalletParam._();
  RecoverWalletParam createEmptyInstance() => create();
  static $pb.PbList<RecoverWalletParam> createRepeated() => $pb.PbList<RecoverWalletParam>();
  @$core.pragma('dart2js:noInline')
  static RecoverWalletParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecoverWalletParam>(create);
  static RecoverWalletParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get data => $_getSZ(3);
  @$pb.TagNumber(4)
  set data($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get startHeight => $_getI64(4);
  @$pb.TagNumber(5)
  set startHeight($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartHeight() => clearField(5);
}

class RecoverWalletResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RecoverWalletResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  RecoverWalletResult._() : super();
  factory RecoverWalletResult() => create();
  factory RecoverWalletResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecoverWalletResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RecoverWalletResult clone() => RecoverWalletResult()..mergeFromMessage(this);
  RecoverWalletResult copyWith(void Function(RecoverWalletResult) updates) => super.copyWith((message) => updates(message as RecoverWalletResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecoverWalletResult create() => RecoverWalletResult._();
  RecoverWalletResult createEmptyInstance() => create();
  static $pb.PbList<RecoverWalletResult> createRepeated() => $pb.PbList<RecoverWalletResult>();
  @$core.pragma('dart2js:noInline')
  static RecoverWalletResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecoverWalletResult>(create);
  static RecoverWalletResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


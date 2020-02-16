///
//  Generated code. Do not modify.
//  source: open_wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OpenWalletParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OpenWalletParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'filename')
    ..aOS(2, 'password')
    ..hasRequiredFields = false
  ;

  OpenWalletParam._() : super();
  factory OpenWalletParam() => create();
  factory OpenWalletParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpenWalletParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OpenWalletParam clone() => OpenWalletParam()..mergeFromMessage(this);
  OpenWalletParam copyWith(void Function(OpenWalletParam) updates) => super.copyWith((message) => updates(message as OpenWalletParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OpenWalletParam create() => OpenWalletParam._();
  OpenWalletParam createEmptyInstance() => create();
  static $pb.PbList<OpenWalletParam> createRepeated() => $pb.PbList<OpenWalletParam>();
  @$core.pragma('dart2js:noInline')
  static OpenWalletParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenWalletParam>(create);
  static OpenWalletParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class OpenWalletResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OpenWalletResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  OpenWalletResult._() : super();
  factory OpenWalletResult() => create();
  factory OpenWalletResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OpenWalletResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OpenWalletResult clone() => OpenWalletResult()..mergeFromMessage(this);
  OpenWalletResult copyWith(void Function(OpenWalletResult) updates) => super.copyWith((message) => updates(message as OpenWalletResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OpenWalletResult create() => OpenWalletResult._();
  OpenWalletResult createEmptyInstance() => create();
  static $pb.PbList<OpenWalletResult> createRepeated() => $pb.PbList<OpenWalletResult>();
  @$core.pragma('dart2js:noInline')
  static OpenWalletResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OpenWalletResult>(create);
  static OpenWalletResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


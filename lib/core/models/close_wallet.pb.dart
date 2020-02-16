///
//  Generated code. Do not modify.
//  source: close_wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CloseWalletParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CloseWalletParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CloseWalletParam._() : super();
  factory CloseWalletParam() => create();
  factory CloseWalletParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloseWalletParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CloseWalletParam clone() => CloseWalletParam()..mergeFromMessage(this);
  CloseWalletParam copyWith(void Function(CloseWalletParam) updates) => super.copyWith((message) => updates(message as CloseWalletParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CloseWalletParam create() => CloseWalletParam._();
  CloseWalletParam createEmptyInstance() => create();
  static $pb.PbList<CloseWalletParam> createRepeated() => $pb.PbList<CloseWalletParam>();
  @$core.pragma('dart2js:noInline')
  static CloseWalletParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloseWalletParam>(create);
  static CloseWalletParam _defaultInstance;
}

class CloseWalletResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CloseWalletResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  CloseWalletResult._() : super();
  factory CloseWalletResult() => create();
  factory CloseWalletResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloseWalletResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CloseWalletResult clone() => CloseWalletResult()..mergeFromMessage(this);
  CloseWalletResult copyWith(void Function(CloseWalletResult) updates) => super.copyWith((message) => updates(message as CloseWalletResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CloseWalletResult create() => CloseWalletResult._();
  CloseWalletResult createEmptyInstance() => create();
  static $pb.PbList<CloseWalletResult> createRepeated() => $pb.PbList<CloseWalletResult>();
  @$core.pragma('dart2js:noInline')
  static CloseWalletResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloseWalletResult>(create);
  static CloseWalletResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


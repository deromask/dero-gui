///
//  Generated code. Do not modify.
//  source: delete_wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DeleteWalletParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteWalletParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeleteWalletParam._() : super();
  factory DeleteWalletParam() => create();
  factory DeleteWalletParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteWalletParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteWalletParam clone() => DeleteWalletParam()..mergeFromMessage(this);
  DeleteWalletParam copyWith(void Function(DeleteWalletParam) updates) => super.copyWith((message) => updates(message as DeleteWalletParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteWalletParam create() => DeleteWalletParam._();
  DeleteWalletParam createEmptyInstance() => create();
  static $pb.PbList<DeleteWalletParam> createRepeated() => $pb.PbList<DeleteWalletParam>();
  @$core.pragma('dart2js:noInline')
  static DeleteWalletParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteWalletParam>(create);
  static DeleteWalletParam _defaultInstance;
}

class DeleteWalletResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteWalletResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  DeleteWalletResult._() : super();
  factory DeleteWalletResult() => create();
  factory DeleteWalletResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteWalletResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeleteWalletResult clone() => DeleteWalletResult()..mergeFromMessage(this);
  DeleteWalletResult copyWith(void Function(DeleteWalletResult) updates) => super.copyWith((message) => updates(message as DeleteWalletResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteWalletResult create() => DeleteWalletResult._();
  DeleteWalletResult createEmptyInstance() => create();
  static $pb.PbList<DeleteWalletResult> createRepeated() => $pb.PbList<DeleteWalletResult>();
  @$core.pragma('dart2js:noInline')
  static DeleteWalletResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteWalletResult>(create);
  static DeleteWalletResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


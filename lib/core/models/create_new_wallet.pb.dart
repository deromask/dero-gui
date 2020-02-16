///
//  Generated code. Do not modify.
//  source: create_new_wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateNewWalletParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateNewWalletParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'filename')
    ..aOS(2, 'password')
    ..hasRequiredFields = false
  ;

  CreateNewWalletParam._() : super();
  factory CreateNewWalletParam() => create();
  factory CreateNewWalletParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNewWalletParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateNewWalletParam clone() => CreateNewWalletParam()..mergeFromMessage(this);
  CreateNewWalletParam copyWith(void Function(CreateNewWalletParam) updates) => super.copyWith((message) => updates(message as CreateNewWalletParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateNewWalletParam create() => CreateNewWalletParam._();
  CreateNewWalletParam createEmptyInstance() => create();
  static $pb.PbList<CreateNewWalletParam> createRepeated() => $pb.PbList<CreateNewWalletParam>();
  @$core.pragma('dart2js:noInline')
  static CreateNewWalletParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNewWalletParam>(create);
  static CreateNewWalletParam _defaultInstance;

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

class CreateNewWalletResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateNewWalletResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  CreateNewWalletResult._() : super();
  factory CreateNewWalletResult() => create();
  factory CreateNewWalletResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNewWalletResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateNewWalletResult clone() => CreateNewWalletResult()..mergeFromMessage(this);
  CreateNewWalletResult copyWith(void Function(CreateNewWalletResult) updates) => super.copyWith((message) => updates(message as CreateNewWalletResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateNewWalletResult create() => CreateNewWalletResult._();
  CreateNewWalletResult createEmptyInstance() => create();
  static $pb.PbList<CreateNewWalletResult> createRepeated() => $pb.PbList<CreateNewWalletResult>();
  @$core.pragma('dart2js:noInline')
  static CreateNewWalletResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNewWalletResult>(create);
  static CreateNewWalletResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


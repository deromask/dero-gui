///
//  Generated code. Do not modify.
//  source: create_demo_wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateDemoWalletParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateDemoWalletParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'filepath')
    ..hasRequiredFields = false
  ;

  CreateDemoWalletParam._() : super();
  factory CreateDemoWalletParam() => create();
  factory CreateDemoWalletParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDemoWalletParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateDemoWalletParam clone() => CreateDemoWalletParam()..mergeFromMessage(this);
  CreateDemoWalletParam copyWith(void Function(CreateDemoWalletParam) updates) => super.copyWith((message) => updates(message as CreateDemoWalletParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDemoWalletParam create() => CreateDemoWalletParam._();
  CreateDemoWalletParam createEmptyInstance() => create();
  static $pb.PbList<CreateDemoWalletParam> createRepeated() => $pb.PbList<CreateDemoWalletParam>();
  @$core.pragma('dart2js:noInline')
  static CreateDemoWalletParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDemoWalletParam>(create);
  static CreateDemoWalletParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filepath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filepath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilepath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilepath() => clearField(1);
}

class CreateDemoWalletResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateDemoWalletResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..aOS(2, 'status')
    ..hasRequiredFields = false
  ;

  CreateDemoWalletResult._() : super();
  factory CreateDemoWalletResult() => create();
  factory CreateDemoWalletResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDemoWalletResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateDemoWalletResult clone() => CreateDemoWalletResult()..mergeFromMessage(this);
  CreateDemoWalletResult copyWith(void Function(CreateDemoWalletResult) updates) => super.copyWith((message) => updates(message as CreateDemoWalletResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDemoWalletResult create() => CreateDemoWalletResult._();
  CreateDemoWalletResult createEmptyInstance() => create();
  static $pb.PbList<CreateDemoWalletResult> createRepeated() => $pb.PbList<CreateDemoWalletResult>();
  @$core.pragma('dart2js:noInline')
  static CreateDemoWalletResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDemoWalletResult>(create);
  static CreateDemoWalletResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}


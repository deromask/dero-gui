///
//  Generated code. Do not modify.
//  source: change_password.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChangePasswordParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChangePasswordParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'password')
    ..hasRequiredFields = false
  ;

  ChangePasswordParam._() : super();
  factory ChangePasswordParam() => create();
  factory ChangePasswordParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChangePasswordParam clone() => ChangePasswordParam()..mergeFromMessage(this);
  ChangePasswordParam copyWith(void Function(ChangePasswordParam) updates) => super.copyWith((message) => updates(message as ChangePasswordParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangePasswordParam create() => ChangePasswordParam._();
  ChangePasswordParam createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordParam> createRepeated() => $pb.PbList<ChangePasswordParam>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordParam>(create);
  static ChangePasswordParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);
}

class ChangePasswordResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChangePasswordResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  ChangePasswordResult._() : super();
  factory ChangePasswordResult() => create();
  factory ChangePasswordResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangePasswordResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChangePasswordResult clone() => ChangePasswordResult()..mergeFromMessage(this);
  ChangePasswordResult copyWith(void Function(ChangePasswordResult) updates) => super.copyWith((message) => updates(message as ChangePasswordResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangePasswordResult create() => ChangePasswordResult._();
  ChangePasswordResult createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordResult> createRepeated() => $pb.PbList<ChangePasswordResult>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangePasswordResult>(create);
  static ChangePasswordResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


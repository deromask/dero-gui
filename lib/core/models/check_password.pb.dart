///
//  Generated code. Do not modify.
//  source: check_password.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CheckPasswordParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CheckPasswordParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'password')
    ..hasRequiredFields = false
  ;

  CheckPasswordParam._() : super();
  factory CheckPasswordParam() => create();
  factory CheckPasswordParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckPasswordParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CheckPasswordParam clone() => CheckPasswordParam()..mergeFromMessage(this);
  CheckPasswordParam copyWith(void Function(CheckPasswordParam) updates) => super.copyWith((message) => updates(message as CheckPasswordParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckPasswordParam create() => CheckPasswordParam._();
  CheckPasswordParam createEmptyInstance() => create();
  static $pb.PbList<CheckPasswordParam> createRepeated() => $pb.PbList<CheckPasswordParam>();
  @$core.pragma('dart2js:noInline')
  static CheckPasswordParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckPasswordParam>(create);
  static CheckPasswordParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);
}

class CheckPasswordResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CheckPasswordResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'valid')
    ..aOS(2, 'status')
    ..hasRequiredFields = false
  ;

  CheckPasswordResult._() : super();
  factory CheckPasswordResult() => create();
  factory CheckPasswordResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckPasswordResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CheckPasswordResult clone() => CheckPasswordResult()..mergeFromMessage(this);
  CheckPasswordResult copyWith(void Function(CheckPasswordResult) updates) => super.copyWith((message) => updates(message as CheckPasswordResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckPasswordResult create() => CheckPasswordResult._();
  CheckPasswordResult createEmptyInstance() => create();
  static $pb.PbList<CheckPasswordResult> createRepeated() => $pb.PbList<CheckPasswordResult>();
  @$core.pragma('dart2js:noInline')
  static CheckPasswordResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckPasswordResult>(create);
  static CheckPasswordResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}


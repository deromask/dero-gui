///
//  Generated code. Do not modify.
//  source: set_mode.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SetModeParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetModeParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'mode')
    ..hasRequiredFields = false
  ;

  SetModeParam._() : super();
  factory SetModeParam() => create();
  factory SetModeParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetModeParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetModeParam clone() => SetModeParam()..mergeFromMessage(this);
  SetModeParam copyWith(void Function(SetModeParam) updates) => super.copyWith((message) => updates(message as SetModeParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetModeParam create() => SetModeParam._();
  SetModeParam createEmptyInstance() => create();
  static $pb.PbList<SetModeParam> createRepeated() => $pb.PbList<SetModeParam>();
  @$core.pragma('dart2js:noInline')
  static SetModeParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetModeParam>(create);
  static SetModeParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get mode => $_getBF(0);
  @$pb.TagNumber(1)
  set mode($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => clearField(1);
}

class SetModeResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetModeResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  SetModeResult._() : super();
  factory SetModeResult() => create();
  factory SetModeResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetModeResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetModeResult clone() => SetModeResult()..mergeFromMessage(this);
  SetModeResult copyWith(void Function(SetModeResult) updates) => super.copyWith((message) => updates(message as SetModeResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetModeResult create() => SetModeResult._();
  SetModeResult createEmptyInstance() => create();
  static $pb.PbList<SetModeResult> createRepeated() => $pb.PbList<SetModeResult>();
  @$core.pragma('dart2js:noInline')
  static SetModeResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetModeResult>(create);
  static SetModeResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


///
//  Generated code. Do not modify.
//  source: set_online.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SetOnlineParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetOnlineParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SetOnlineParam._() : super();
  factory SetOnlineParam() => create();
  factory SetOnlineParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetOnlineParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetOnlineParam clone() => SetOnlineParam()..mergeFromMessage(this);
  SetOnlineParam copyWith(void Function(SetOnlineParam) updates) => super.copyWith((message) => updates(message as SetOnlineParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetOnlineParam create() => SetOnlineParam._();
  SetOnlineParam createEmptyInstance() => create();
  static $pb.PbList<SetOnlineParam> createRepeated() => $pb.PbList<SetOnlineParam>();
  @$core.pragma('dart2js:noInline')
  static SetOnlineParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetOnlineParam>(create);
  static SetOnlineParam _defaultInstance;
}

class SetOnlineResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetOnlineResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  SetOnlineResult._() : super();
  factory SetOnlineResult() => create();
  factory SetOnlineResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetOnlineResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetOnlineResult clone() => SetOnlineResult()..mergeFromMessage(this);
  SetOnlineResult copyWith(void Function(SetOnlineResult) updates) => super.copyWith((message) => updates(message as SetOnlineResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetOnlineResult create() => SetOnlineResult._();
  SetOnlineResult createEmptyInstance() => create();
  static $pb.PbList<SetOnlineResult> createRepeated() => $pb.PbList<SetOnlineResult>();
  @$core.pragma('dart2js:noInline')
  static SetOnlineResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetOnlineResult>(create);
  static SetOnlineResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


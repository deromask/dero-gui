///
//  Generated code. Do not modify.
//  source: set_offline.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SetOfflineParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetOfflineParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  SetOfflineParam._() : super();
  factory SetOfflineParam() => create();
  factory SetOfflineParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetOfflineParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetOfflineParam clone() => SetOfflineParam()..mergeFromMessage(this);
  SetOfflineParam copyWith(void Function(SetOfflineParam) updates) => super.copyWith((message) => updates(message as SetOfflineParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetOfflineParam create() => SetOfflineParam._();
  SetOfflineParam createEmptyInstance() => create();
  static $pb.PbList<SetOfflineParam> createRepeated() => $pb.PbList<SetOfflineParam>();
  @$core.pragma('dart2js:noInline')
  static SetOfflineParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetOfflineParam>(create);
  static SetOfflineParam _defaultInstance;
}

class SetOfflineResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetOfflineResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  SetOfflineResult._() : super();
  factory SetOfflineResult() => create();
  factory SetOfflineResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetOfflineResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetOfflineResult clone() => SetOfflineResult()..mergeFromMessage(this);
  SetOfflineResult copyWith(void Function(SetOfflineResult) updates) => super.copyWith((message) => updates(message as SetOfflineResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetOfflineResult create() => SetOfflineResult._();
  SetOfflineResult createEmptyInstance() => create();
  static $pb.PbList<SetOfflineResult> createRepeated() => $pb.PbList<SetOfflineResult>();
  @$core.pragma('dart2js:noInline')
  static SetOfflineResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetOfflineResult>(create);
  static SetOfflineResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


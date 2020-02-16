///
//  Generated code. Do not modify.
//  source: set_cleanup_interval.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SetCleanupIntervalParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetCleanupIntervalParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'duration', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  SetCleanupIntervalParam._() : super();
  factory SetCleanupIntervalParam() => create();
  factory SetCleanupIntervalParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCleanupIntervalParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetCleanupIntervalParam clone() => SetCleanupIntervalParam()..mergeFromMessage(this);
  SetCleanupIntervalParam copyWith(void Function(SetCleanupIntervalParam) updates) => super.copyWith((message) => updates(message as SetCleanupIntervalParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetCleanupIntervalParam create() => SetCleanupIntervalParam._();
  SetCleanupIntervalParam createEmptyInstance() => create();
  static $pb.PbList<SetCleanupIntervalParam> createRepeated() => $pb.PbList<SetCleanupIntervalParam>();
  @$core.pragma('dart2js:noInline')
  static SetCleanupIntervalParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCleanupIntervalParam>(create);
  static SetCleanupIntervalParam _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get duration => $_getI64(0);
  @$pb.TagNumber(1)
  set duration($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearDuration() => clearField(1);
}

class SetCleanupIntervalResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetCleanupIntervalResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'status')
    ..hasRequiredFields = false
  ;

  SetCleanupIntervalResult._() : super();
  factory SetCleanupIntervalResult() => create();
  factory SetCleanupIntervalResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetCleanupIntervalResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetCleanupIntervalResult clone() => SetCleanupIntervalResult()..mergeFromMessage(this);
  SetCleanupIntervalResult copyWith(void Function(SetCleanupIntervalResult) updates) => super.copyWith((message) => updates(message as SetCleanupIntervalResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetCleanupIntervalResult create() => SetCleanupIntervalResult._();
  SetCleanupIntervalResult createEmptyInstance() => create();
  static $pb.PbList<SetCleanupIntervalResult> createRepeated() => $pb.PbList<SetCleanupIntervalResult>();
  @$core.pragma('dart2js:noInline')
  static SetCleanupIntervalResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetCleanupIntervalResult>(create);
  static SetCleanupIntervalResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


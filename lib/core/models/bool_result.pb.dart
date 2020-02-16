///
//  Generated code. Do not modify.
//  source: bool_result.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BoolResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BoolResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'result')
    ..aOS(2, 'failSafe')
    ..hasRequiredFields = false
  ;

  BoolResult._() : super();
  factory BoolResult() => create();
  factory BoolResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoolResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BoolResult clone() => BoolResult()..mergeFromMessage(this);
  BoolResult copyWith(void Function(BoolResult) updates) => super.copyWith((message) => updates(message as BoolResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoolResult create() => BoolResult._();
  BoolResult createEmptyInstance() => create();
  static $pb.PbList<BoolResult> createRepeated() => $pb.PbList<BoolResult>();
  @$core.pragma('dart2js:noInline')
  static BoolResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoolResult>(create);
  static BoolResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get failSafe => $_getSZ(1);
  @$pb.TagNumber(2)
  set failSafe($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFailSafe() => $_has(1);
  @$pb.TagNumber(2)
  void clearFailSafe() => clearField(2);
}


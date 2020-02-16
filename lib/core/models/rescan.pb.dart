///
//  Generated code. Do not modify.
//  source: rescan.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RescanParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RescanParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aInt64(1, 'height')
    ..hasRequiredFields = false
  ;

  RescanParam._() : super();
  factory RescanParam() => create();
  factory RescanParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RescanParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RescanParam clone() => RescanParam()..mergeFromMessage(this);
  RescanParam copyWith(void Function(RescanParam) updates) => super.copyWith((message) => updates(message as RescanParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RescanParam create() => RescanParam._();
  RescanParam createEmptyInstance() => create();
  static $pb.PbList<RescanParam> createRepeated() => $pb.PbList<RescanParam>();
  @$core.pragma('dart2js:noInline')
  static RescanParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RescanParam>(create);
  static RescanParam _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class RescanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RescanResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  RescanResult._() : super();
  factory RescanResult() => create();
  factory RescanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RescanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RescanResult clone() => RescanResult()..mergeFromMessage(this);
  RescanResult copyWith(void Function(RescanResult) updates) => super.copyWith((message) => updates(message as RescanResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RescanResult create() => RescanResult._();
  RescanResult createEmptyInstance() => create();
  static $pb.PbList<RescanResult> createRepeated() => $pb.PbList<RescanResult>();
  @$core.pragma('dart2js:noInline')
  static RescanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RescanResult>(create);
  static RescanResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


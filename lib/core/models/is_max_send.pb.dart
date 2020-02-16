///
//  Generated code. Do not modify.
//  source: is_max_send.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class IsMaxSendParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('IsMaxSendParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'amount')
    ..hasRequiredFields = false
  ;

  IsMaxSendParam._() : super();
  factory IsMaxSendParam() => create();
  factory IsMaxSendParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsMaxSendParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  IsMaxSendParam clone() => IsMaxSendParam()..mergeFromMessage(this);
  IsMaxSendParam copyWith(void Function(IsMaxSendParam) updates) => super.copyWith((message) => updates(message as IsMaxSendParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsMaxSendParam create() => IsMaxSendParam._();
  IsMaxSendParam createEmptyInstance() => create();
  static $pb.PbList<IsMaxSendParam> createRepeated() => $pb.PbList<IsMaxSendParam>();
  @$core.pragma('dart2js:noInline')
  static IsMaxSendParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsMaxSendParam>(create);
  static IsMaxSendParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get amount => $_getSZ(0);
  @$pb.TagNumber(1)
  set amount($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

class IsMaxSendResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('IsMaxSendResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'result')
    ..hasRequiredFields = false
  ;

  IsMaxSendResult._() : super();
  factory IsMaxSendResult() => create();
  factory IsMaxSendResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsMaxSendResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  IsMaxSendResult clone() => IsMaxSendResult()..mergeFromMessage(this);
  IsMaxSendResult copyWith(void Function(IsMaxSendResult) updates) => super.copyWith((message) => updates(message as IsMaxSendResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsMaxSendResult create() => IsMaxSendResult._();
  IsMaxSendResult createEmptyInstance() => create();
  static $pb.PbList<IsMaxSendResult> createRepeated() => $pb.PbList<IsMaxSendResult>();
  @$core.pragma('dart2js:noInline')
  static IsMaxSendResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsMaxSendResult>(create);
  static IsMaxSendResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}


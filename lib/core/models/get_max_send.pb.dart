///
//  Generated code. Do not modify.
//  source: get_max_send.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetMaxSendParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetMaxSendParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetMaxSendParam._() : super();
  factory GetMaxSendParam() => create();
  factory GetMaxSendParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMaxSendParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetMaxSendParam clone() => GetMaxSendParam()..mergeFromMessage(this);
  GetMaxSendParam copyWith(void Function(GetMaxSendParam) updates) => super.copyWith((message) => updates(message as GetMaxSendParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetMaxSendParam create() => GetMaxSendParam._();
  GetMaxSendParam createEmptyInstance() => create();
  static $pb.PbList<GetMaxSendParam> createRepeated() => $pb.PbList<GetMaxSendParam>();
  @$core.pragma('dart2js:noInline')
  static GetMaxSendParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMaxSendParam>(create);
  static GetMaxSendParam _defaultInstance;
}

class GetMaxSendResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetMaxSendResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'amountFormat')
    ..hasRequiredFields = false
  ;

  GetMaxSendResult._() : super();
  factory GetMaxSendResult() => create();
  factory GetMaxSendResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMaxSendResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetMaxSendResult clone() => GetMaxSendResult()..mergeFromMessage(this);
  GetMaxSendResult copyWith(void Function(GetMaxSendResult) updates) => super.copyWith((message) => updates(message as GetMaxSendResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetMaxSendResult create() => GetMaxSendResult._();
  GetMaxSendResult createEmptyInstance() => create();
  static $pb.PbList<GetMaxSendResult> createRepeated() => $pb.PbList<GetMaxSendResult>();
  @$core.pragma('dart2js:noInline')
  static GetMaxSendResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMaxSendResult>(create);
  static GetMaxSendResult _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get amountFormat => $_getSZ(1);
  @$pb.TagNumber(2)
  set amountFormat($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmountFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmountFormat() => clearField(2);
}


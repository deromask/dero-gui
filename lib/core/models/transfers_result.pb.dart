///
//  Generated code. Do not modify.
//  source: transfers_result.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class TransfersResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransfersResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'fee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'txKey')
    ..aOS(3, 'txHash')
    ..aOS(4, 'txBlob')
    ..hasRequiredFields = false
  ;

  TransfersResult._() : super();
  factory TransfersResult() => create();
  factory TransfersResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransfersResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransfersResult clone() => TransfersResult()..mergeFromMessage(this);
  TransfersResult copyWith(void Function(TransfersResult) updates) => super.copyWith((message) => updates(message as TransfersResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransfersResult create() => TransfersResult._();
  TransfersResult createEmptyInstance() => create();
  static $pb.PbList<TransfersResult> createRepeated() => $pb.PbList<TransfersResult>();
  @$core.pragma('dart2js:noInline')
  static TransfersResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransfersResult>(create);
  static TransfersResult _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get txKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set txKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get txHash => $_getSZ(2);
  @$pb.TagNumber(3)
  set txHash($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxHash() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get txBlob => $_getSZ(3);
  @$pb.TagNumber(4)
  set txBlob($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTxBlob() => $_has(3);
  @$pb.TagNumber(4)
  void clearTxBlob() => clearField(4);
}


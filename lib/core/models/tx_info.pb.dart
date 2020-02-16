///
//  Generated code. Do not modify.
//  source: tx_info.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class TxInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TxInfo', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'fee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'hash')
    ..a<$core.List<$core.int>>(3, 'blob', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  TxInfo._() : super();
  factory TxInfo() => create();
  factory TxInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TxInfo clone() => TxInfo()..mergeFromMessage(this);
  TxInfo copyWith(void Function(TxInfo) updates) => super.copyWith((message) => updates(message as TxInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TxInfo create() => TxInfo._();
  TxInfo createEmptyInstance() => create();
  static $pb.PbList<TxInfo> createRepeated() => $pb.PbList<TxInfo>();
  @$core.pragma('dart2js:noInline')
  static TxInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxInfo>(create);
  static TxInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hash => $_getSZ(1);
  @$pb.TagNumber(2)
  set hash($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get blob => $_getN(2);
  @$pb.TagNumber(3)
  set blob($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlob() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlob() => clearField(3);
}


///
//  Generated code. Do not modify.
//  source: transfers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'destination.pb.dart' as $0;

class TransfersParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransfersParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..pc<$0.Destination>(1, 'Destinations', $pb.PbFieldType.PM, protoName: 'Destinations', subBuilder: $0.Destination.create)
    ..a<$fixnum.Int64>(2, 'fee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, 'mixin', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, 'unlockTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, 'paymentId')
    ..aOB(6, 'getTxKey')
    ..a<$fixnum.Int64>(7, 'priority', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(8, 'getTxHex')
    ..hasRequiredFields = false
  ;

  TransfersParam._() : super();
  factory TransfersParam() => create();
  factory TransfersParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransfersParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransfersParam clone() => TransfersParam()..mergeFromMessage(this);
  TransfersParam copyWith(void Function(TransfersParam) updates) => super.copyWith((message) => updates(message as TransfersParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransfersParam create() => TransfersParam._();
  TransfersParam createEmptyInstance() => create();
  static $pb.PbList<TransfersParam> createRepeated() => $pb.PbList<TransfersParam>();
  @$core.pragma('dart2js:noInline')
  static TransfersParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransfersParam>(create);
  static TransfersParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Destination> get destinations => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get mixin => $_getI64(2);
  @$pb.TagNumber(3)
  set mixin($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMixin() => $_has(2);
  @$pb.TagNumber(3)
  void clearMixin() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get unlockTime => $_getI64(3);
  @$pb.TagNumber(4)
  set unlockTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUnlockTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnlockTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get paymentId => $_getSZ(4);
  @$pb.TagNumber(5)
  set paymentId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPaymentId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaymentId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get getTxKey => $_getBF(5);
  @$pb.TagNumber(6)
  set getTxKey($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGetTxKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearGetTxKey() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get priority => $_getI64(6);
  @$pb.TagNumber(7)
  set priority($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPriority() => $_has(6);
  @$pb.TagNumber(7)
  void clearPriority() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get getTxHex => $_getBF(7);
  @$pb.TagNumber(8)
  set getTxHex($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasGetTxHex() => $_has(7);
  @$pb.TagNumber(8)
  void clearGetTxHex() => clearField(8);
}


///
//  Generated code. Do not modify.
//  source: transfers_everything.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class TransfersEverythingParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransfersEverythingParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..a<$fixnum.Int64>(2, 'fee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, 'mixin', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, 'unlockTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, 'paymentId')
    ..hasRequiredFields = false
  ;

  TransfersEverythingParam._() : super();
  factory TransfersEverythingParam() => create();
  factory TransfersEverythingParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransfersEverythingParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransfersEverythingParam clone() => TransfersEverythingParam()..mergeFromMessage(this);
  TransfersEverythingParam copyWith(void Function(TransfersEverythingParam) updates) => super.copyWith((message) => updates(message as TransfersEverythingParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransfersEverythingParam create() => TransfersEverythingParam._();
  TransfersEverythingParam createEmptyInstance() => create();
  static $pb.PbList<TransfersEverythingParam> createRepeated() => $pb.PbList<TransfersEverythingParam>();
  @$core.pragma('dart2js:noInline')
  static TransfersEverythingParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransfersEverythingParam>(create);
  static TransfersEverythingParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

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
}


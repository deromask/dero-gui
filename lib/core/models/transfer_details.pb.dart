///
//  Generated code. Do not modify.
//  source: transfer_details.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'destination.pb.dart' as $0;

class TransferDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferDetails', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'txid')
    ..aOS(2, 'paymentId')
    ..a<$fixnum.Int64>(3, 'blockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(4, 'blockTopoheight')
    ..a<$fixnum.Int64>(5, 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, 'fee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, 'unlockTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$0.Destination>(8, 'Destinations', $pb.PbFieldType.PM, protoName: 'Destinations', subBuilder: $0.Destination.create)
    ..aOS(9, 'secretTxKey')
    ..aOS(10, 'type')
    ..a<$fixnum.Int64>(11, 'timestamp', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  TransferDetails._() : super();
  factory TransferDetails() => create();
  factory TransferDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransferDetails clone() => TransferDetails()..mergeFromMessage(this);
  TransferDetails copyWith(void Function(TransferDetails) updates) => super.copyWith((message) => updates(message as TransferDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferDetails create() => TransferDetails._();
  TransferDetails createEmptyInstance() => create();
  static $pb.PbList<TransferDetails> createRepeated() => $pb.PbList<TransferDetails>();
  @$core.pragma('dart2js:noInline')
  static TransferDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferDetails>(create);
  static TransferDetails _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txid => $_getSZ(0);
  @$pb.TagNumber(1)
  set txid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaymentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blockHeight => $_getI64(2);
  @$pb.TagNumber(3)
  set blockHeight($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockHeight() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get blockTopoheight => $_getI64(3);
  @$pb.TagNumber(4)
  set blockTopoheight($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBlockTopoheight() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockTopoheight() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get amount => $_getI64(4);
  @$pb.TagNumber(5)
  set amount($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get fee => $_getI64(5);
  @$pb.TagNumber(6)
  set fee($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearFee() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get unlockTime => $_getI64(6);
  @$pb.TagNumber(7)
  set unlockTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUnlockTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnlockTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$0.Destination> get destinations => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get secretTxKey => $_getSZ(8);
  @$pb.TagNumber(9)
  set secretTxKey($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSecretTxKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearSecretTxKey() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get type => $_getSZ(9);
  @$pb.TagNumber(10)
  set type($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get timestamp => $_getI64(10);
  @$pb.TagNumber(11)
  set timestamp($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTimestamp() => $_has(10);
  @$pb.TagNumber(11)
  void clearTimestamp() => clearField(11);
}


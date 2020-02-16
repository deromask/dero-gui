///
//  Generated code. Do not modify.
//  source: get_transfer_fee.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetTransferFeeParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransferFeeParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetTransferFeeParam._() : super();
  factory GetTransferFeeParam() => create();
  factory GetTransferFeeParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransferFeeParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransferFeeParam clone() => GetTransferFeeParam()..mergeFromMessage(this);
  GetTransferFeeParam copyWith(void Function(GetTransferFeeParam) updates) => super.copyWith((message) => updates(message as GetTransferFeeParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransferFeeParam create() => GetTransferFeeParam._();
  GetTransferFeeParam createEmptyInstance() => create();
  static $pb.PbList<GetTransferFeeParam> createRepeated() => $pb.PbList<GetTransferFeeParam>();
  @$core.pragma('dart2js:noInline')
  static GetTransferFeeParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransferFeeParam>(create);
  static GetTransferFeeParam _defaultInstance;
}

class GetTransferFeeResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransferFeeResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'fee', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'feeFormat')
    ..hasRequiredFields = false
  ;

  GetTransferFeeResult._() : super();
  factory GetTransferFeeResult() => create();
  factory GetTransferFeeResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransferFeeResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransferFeeResult clone() => GetTransferFeeResult()..mergeFromMessage(this);
  GetTransferFeeResult copyWith(void Function(GetTransferFeeResult) updates) => super.copyWith((message) => updates(message as GetTransferFeeResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransferFeeResult create() => GetTransferFeeResult._();
  GetTransferFeeResult createEmptyInstance() => create();
  static $pb.PbList<GetTransferFeeResult> createRepeated() => $pb.PbList<GetTransferFeeResult>();
  @$core.pragma('dart2js:noInline')
  static GetTransferFeeResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransferFeeResult>(create);
  static GetTransferFeeResult _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get feeFormat => $_getSZ(1);
  @$pb.TagNumber(2)
  set feeFormat($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFeeFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeeFormat() => clearField(2);
}


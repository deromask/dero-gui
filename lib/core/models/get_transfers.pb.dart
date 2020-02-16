///
//  Generated code. Do not modify.
//  source: get_transfers.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'transfer_details.pb.dart' as $1;

class GetTransfersParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransfersParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'in')
    ..aOB(2, 'out')
    ..aOB(3, 'pending')
    ..aOB(4, 'failed')
    ..aOB(5, 'pool')
    ..aOB(6, 'filterByHeight')
    ..a<$fixnum.Int64>(7, 'minHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, 'maxHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetTransfersParam._() : super();
  factory GetTransfersParam() => create();
  factory GetTransfersParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransfersParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransfersParam clone() => GetTransfersParam()..mergeFromMessage(this);
  GetTransfersParam copyWith(void Function(GetTransfersParam) updates) => super.copyWith((message) => updates(message as GetTransfersParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransfersParam create() => GetTransfersParam._();
  GetTransfersParam createEmptyInstance() => create();
  static $pb.PbList<GetTransfersParam> createRepeated() => $pb.PbList<GetTransfersParam>();
  @$core.pragma('dart2js:noInline')
  static GetTransfersParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransfersParam>(create);
  static GetTransfersParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get in_1 => $_getBF(0);
  @$pb.TagNumber(1)
  set in_1($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIn_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearIn_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get out => $_getBF(1);
  @$pb.TagNumber(2)
  set out($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearOut() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get pending => $_getBF(2);
  @$pb.TagNumber(3)
  set pending($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPending() => $_has(2);
  @$pb.TagNumber(3)
  void clearPending() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get failed => $_getBF(3);
  @$pb.TagNumber(4)
  set failed($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFailed() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailed() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get pool => $_getBF(4);
  @$pb.TagNumber(5)
  set pool($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPool() => $_has(4);
  @$pb.TagNumber(5)
  void clearPool() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get filterByHeight => $_getBF(5);
  @$pb.TagNumber(6)
  set filterByHeight($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFilterByHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearFilterByHeight() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get minHeight => $_getI64(6);
  @$pb.TagNumber(7)
  set minHeight($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMinHeight() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinHeight() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get maxHeight => $_getI64(7);
  @$pb.TagNumber(8)
  set maxHeight($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxHeight() => clearField(8);
}

class GetTransfersResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransfersResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..pc<$1.TransferDetails>(1, 'desc', $pb.PbFieldType.PM, subBuilder: $1.TransferDetails.create)
    ..hasRequiredFields = false
  ;

  GetTransfersResult._() : super();
  factory GetTransfersResult() => create();
  factory GetTransfersResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransfersResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransfersResult clone() => GetTransfersResult()..mergeFromMessage(this);
  GetTransfersResult copyWith(void Function(GetTransfersResult) updates) => super.copyWith((message) => updates(message as GetTransfersResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransfersResult create() => GetTransfersResult._();
  GetTransfersResult createEmptyInstance() => create();
  static $pb.PbList<GetTransfersResult> createRepeated() => $pb.PbList<GetTransfersResult>();
  @$core.pragma('dart2js:noInline')
  static GetTransfersResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransfersResult>(create);
  static GetTransfersResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.TransferDetails> get desc => $_getList(0);
}


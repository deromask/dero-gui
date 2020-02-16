///
//  Generated code. Do not modify.
//  source: relay_tx.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RelayTxParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RelayTxParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'hash')
    ..hasRequiredFields = false
  ;

  RelayTxParam._() : super();
  factory RelayTxParam() => create();
  factory RelayTxParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayTxParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RelayTxParam clone() => RelayTxParam()..mergeFromMessage(this);
  RelayTxParam copyWith(void Function(RelayTxParam) updates) => super.copyWith((message) => updates(message as RelayTxParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelayTxParam create() => RelayTxParam._();
  RelayTxParam createEmptyInstance() => create();
  static $pb.PbList<RelayTxParam> createRepeated() => $pb.PbList<RelayTxParam>();
  @$core.pragma('dart2js:noInline')
  static RelayTxParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayTxParam>(create);
  static RelayTxParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);
}


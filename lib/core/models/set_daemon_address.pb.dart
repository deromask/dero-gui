///
//  Generated code. Do not modify.
//  source: set_daemon_address.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SetDaemonAddressParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetDaemonAddressParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..hasRequiredFields = false
  ;

  SetDaemonAddressParam._() : super();
  factory SetDaemonAddressParam() => create();
  factory SetDaemonAddressParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetDaemonAddressParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetDaemonAddressParam clone() => SetDaemonAddressParam()..mergeFromMessage(this);
  SetDaemonAddressParam copyWith(void Function(SetDaemonAddressParam) updates) => super.copyWith((message) => updates(message as SetDaemonAddressParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetDaemonAddressParam create() => SetDaemonAddressParam._();
  SetDaemonAddressParam createEmptyInstance() => create();
  static $pb.PbList<SetDaemonAddressParam> createRepeated() => $pb.PbList<SetDaemonAddressParam>();
  @$core.pragma('dart2js:noInline')
  static SetDaemonAddressParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetDaemonAddressParam>(create);
  static SetDaemonAddressParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class SetDaemonAddressResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetDaemonAddressResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  SetDaemonAddressResult._() : super();
  factory SetDaemonAddressResult() => create();
  factory SetDaemonAddressResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetDaemonAddressResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetDaemonAddressResult clone() => SetDaemonAddressResult()..mergeFromMessage(this);
  SetDaemonAddressResult copyWith(void Function(SetDaemonAddressResult) updates) => super.copyWith((message) => updates(message as SetDaemonAddressResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetDaemonAddressResult create() => SetDaemonAddressResult._();
  SetDaemonAddressResult createEmptyInstance() => create();
  static $pb.PbList<SetDaemonAddressResult> createRepeated() => $pb.PbList<SetDaemonAddressResult>();
  @$core.pragma('dart2js:noInline')
  static SetDaemonAddressResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetDaemonAddressResult>(create);
  static SetDaemonAddressResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


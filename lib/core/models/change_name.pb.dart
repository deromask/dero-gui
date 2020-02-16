///
//  Generated code. Do not modify.
//  source: change_name.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChangeNameParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChangeNameParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'filepath')
    ..hasRequiredFields = false
  ;

  ChangeNameParam._() : super();
  factory ChangeNameParam() => create();
  factory ChangeNameParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeNameParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChangeNameParam clone() => ChangeNameParam()..mergeFromMessage(this);
  ChangeNameParam copyWith(void Function(ChangeNameParam) updates) => super.copyWith((message) => updates(message as ChangeNameParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangeNameParam create() => ChangeNameParam._();
  ChangeNameParam createEmptyInstance() => create();
  static $pb.PbList<ChangeNameParam> createRepeated() => $pb.PbList<ChangeNameParam>();
  @$core.pragma('dart2js:noInline')
  static ChangeNameParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeNameParam>(create);
  static ChangeNameParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filepath => $_getSZ(0);
  @$pb.TagNumber(1)
  set filepath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilepath() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilepath() => clearField(1);
}

class ChangeNameResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChangeNameResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'status')
    ..hasRequiredFields = false
  ;

  ChangeNameResult._() : super();
  factory ChangeNameResult() => create();
  factory ChangeNameResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeNameResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChangeNameResult clone() => ChangeNameResult()..mergeFromMessage(this);
  ChangeNameResult copyWith(void Function(ChangeNameResult) updates) => super.copyWith((message) => updates(message as ChangeNameResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangeNameResult create() => ChangeNameResult._();
  ChangeNameResult createEmptyInstance() => create();
  static $pb.PbList<ChangeNameResult> createRepeated() => $pb.PbList<ChangeNameResult>();
  @$core.pragma('dart2js:noInline')
  static ChangeNameResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeNameResult>(create);
  static ChangeNameResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}


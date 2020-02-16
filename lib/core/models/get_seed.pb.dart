///
//  Generated code. Do not modify.
//  source: get_seed.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetSeedParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetSeedParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'lang')
    ..hasRequiredFields = false
  ;

  GetSeedParam._() : super();
  factory GetSeedParam() => create();
  factory GetSeedParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSeedParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetSeedParam clone() => GetSeedParam()..mergeFromMessage(this);
  GetSeedParam copyWith(void Function(GetSeedParam) updates) => super.copyWith((message) => updates(message as GetSeedParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSeedParam create() => GetSeedParam._();
  GetSeedParam createEmptyInstance() => create();
  static $pb.PbList<GetSeedParam> createRepeated() => $pb.PbList<GetSeedParam>();
  @$core.pragma('dart2js:noInline')
  static GetSeedParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSeedParam>(create);
  static GetSeedParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lang => $_getSZ(0);
  @$pb.TagNumber(1)
  set lang($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLang() => $_has(0);
  @$pb.TagNumber(1)
  void clearLang() => clearField(1);
}

class GetSeedResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetSeedResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'seed')
    ..hasRequiredFields = false
  ;

  GetSeedResult._() : super();
  factory GetSeedResult() => create();
  factory GetSeedResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSeedResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetSeedResult clone() => GetSeedResult()..mergeFromMessage(this);
  GetSeedResult copyWith(void Function(GetSeedResult) updates) => super.copyWith((message) => updates(message as GetSeedResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSeedResult create() => GetSeedResult._();
  GetSeedResult createEmptyInstance() => create();
  static $pb.PbList<GetSeedResult> createRepeated() => $pb.PbList<GetSeedResult>();
  @$core.pragma('dart2js:noInline')
  static GetSeedResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSeedResult>(create);
  static GetSeedResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get seed => $_getSZ(0);
  @$pb.TagNumber(1)
  set seed($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSeed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeed() => clearField(1);
}


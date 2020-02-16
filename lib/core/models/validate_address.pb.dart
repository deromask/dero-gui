///
//  Generated code. Do not modify.
//  source: validate_address.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ValidateAddressParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ValidateAddressParam', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..hasRequiredFields = false
  ;

  ValidateAddressParam._() : super();
  factory ValidateAddressParam() => create();
  factory ValidateAddressParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateAddressParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ValidateAddressParam clone() => ValidateAddressParam()..mergeFromMessage(this);
  ValidateAddressParam copyWith(void Function(ValidateAddressParam) updates) => super.copyWith((message) => updates(message as ValidateAddressParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValidateAddressParam create() => ValidateAddressParam._();
  ValidateAddressParam createEmptyInstance() => create();
  static $pb.PbList<ValidateAddressParam> createRepeated() => $pb.PbList<ValidateAddressParam>();
  @$core.pragma('dart2js:noInline')
  static ValidateAddressParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateAddressParam>(create);
  static ValidateAddressParam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class ValidateAddressResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ValidateAddressResult', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOB(1, 'valid')
    ..aOS(2, 'status')
    ..hasRequiredFields = false
  ;

  ValidateAddressResult._() : super();
  factory ValidateAddressResult() => create();
  factory ValidateAddressResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateAddressResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ValidateAddressResult clone() => ValidateAddressResult()..mergeFromMessage(this);
  ValidateAddressResult copyWith(void Function(ValidateAddressResult) updates) => super.copyWith((message) => updates(message as ValidateAddressResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValidateAddressResult create() => ValidateAddressResult._();
  ValidateAddressResult createEmptyInstance() => create();
  static $pb.PbList<ValidateAddressResult> createRepeated() => $pb.PbList<ValidateAddressResult>();
  @$core.pragma('dart2js:noInline')
  static ValidateAddressResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateAddressResult>(create);
  static ValidateAddressResult _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}


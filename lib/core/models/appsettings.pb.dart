///
//  Generated code. Do not modify.
//  source: appsettings.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AppSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AppSettings', package: const $pb.PackageName('model'), createEmptyInstance: create)
    ..aOS(1, 'daemonAddress')
    ..aOS(2, 'theme')
    ..hasRequiredFields = false
  ;

  AppSettings._() : super();
  factory AppSettings() => create();
  factory AppSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AppSettings clone() => AppSettings()..mergeFromMessage(this);
  AppSettings copyWith(void Function(AppSettings) updates) => super.copyWith((message) => updates(message as AppSettings));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppSettings create() => AppSettings._();
  AppSettings createEmptyInstance() => create();
  static $pb.PbList<AppSettings> createRepeated() => $pb.PbList<AppSettings>();
  @$core.pragma('dart2js:noInline')
  static AppSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppSettings>(create);
  static AppSettings _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get daemonAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set daemonAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDaemonAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearDaemonAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get theme => $_getSZ(1);
  @$pb.TagNumber(2)
  set theme($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTheme() => $_has(1);
  @$pb.TagNumber(2)
  void clearTheme() => clearField(2);
}


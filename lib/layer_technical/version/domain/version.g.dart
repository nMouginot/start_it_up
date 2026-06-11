// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
  major: (json['major'] as num).toInt(),
  minor: (json['minor'] as num).toInt(),
  patch: (json['patch'] as num).toInt(),
);

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
  'major': instance.major,
  'minor': instance.minor,
  'patch': instance.patch,
};

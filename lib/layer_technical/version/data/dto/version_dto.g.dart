// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'version_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionDto _$VersionDtoFromJson(Map<String, dynamic> json) => VersionDto(
  major: (json['major'] as num).toInt(),
  minor: (json['minor'] as num).toInt(),
  patch: (json['patch'] as num).toInt(),
);

Map<String, dynamic> _$VersionDtoToJson(VersionDto instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
    };

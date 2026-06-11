import 'package:json_annotation/json_annotation.dart';

part 'version_dto.g.dart';

@JsonSerializable()
class VersionDto {
  final int major;
  final int minor;
  final int patch;

  const VersionDto({
    required this.major,
    required this.minor,
    required this.patch,
  });

  Map<String, dynamic> toJson() => _$VersionDtoToJson(this);
  factory VersionDto.fromJson(Map<String, dynamic> json) =>
      _$VersionDtoFromJson(json);
}

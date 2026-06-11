import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class Version {
  final int major;
  final int minor;
  final int patch;

  String get fullVersion => "$major.$minor.$patch";

  const Version({
    required this.major,
    required this.minor,
    required this.patch,
  });

  factory Version.parse(String value) {
    final version = tryParse(value);
    if (version == null) {
      throw FormatException('Invalid version format: "$value"');
    }
    return version;
  }

  static Version? tryParse(String value) {
    final parts = value.trim().split('.');
    if (parts.length != 3) return null;

    final major = int.tryParse(parts[0]);
    final minor = int.tryParse(parts[1]);
    final patch = int.tryParse(parts[2]);
    if (major == null || minor == null || patch == null) return null;

    return Version(major: major, minor: minor, patch: patch);
  }

  factory Version.faker([seed = 1]) {
    final random = Random(seed);

    final majorVersionNumber = random.nextInt(10);
    final minorVersionNumber = random.nextInt(10);
    final patchVersionNumber = random.nextInt(10);

    return Version(
      major: majorVersionNumber,
      minor: minorVersionNumber,
      patch: patchVersionNumber,
    );
  }

  Map<String, dynamic> toJson() => _$VersionToJson(this);
  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}

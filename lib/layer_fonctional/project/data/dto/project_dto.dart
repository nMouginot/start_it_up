import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:faker/faker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:start_it_up/layer_technical/version/data/dto/version_dto.dart';

import '../../../objectif/data/dto/objectif_dto.dart';

part 'project_dto.g.dart';

@CopyWith()
@JsonSerializable()
class ProjectDto {
  final int id;
  final String name;
  final VersionDto version;
  final List<ObjectifDto> objectifs;

  const ProjectDto({
    required this.id,
    required this.name,
    required this.version,
    required this.objectifs,
  });

  factory ProjectDto.faker([int seed = 1]) {
    final fakeData = Faker.withGenerator(RandomGenerator(seed: seed));
    final random = Random(seed);

    final major = random.nextInt(10);
    final minor = random.nextInt(10);
    final patch = random.nextInt(10);

    final objectifCount = seed % 5;
    final objectifs = List.generate(
      objectifCount,
      (index) => ObjectifDto.faker(seed * 100 + index + 1),
    );

    return ProjectDto(
      id: seed,
      objectifs: objectifs,
      name: fakeData.company.name(),
      version: VersionDto(major: major, minor: minor, patch: patch),
    );
  }

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
}

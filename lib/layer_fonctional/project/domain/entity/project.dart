import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:faker/faker.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../layer_technical/version/domain/version.dart';
import '../../../objectif/domain/entity/objectif.dart';

part 'project.g.dart';

@CopyWith()
@JsonSerializable()
class Project {
  final int id;

  final String name;

  final Version version;

  final List<Objectif> listObjectif;

  const Project({
    required this.id,
    required this.name,
    required this.version,
    required this.listObjectif,
  });

  factory Project.faker([int seed = 1]) {
    final fakeData = Faker.withGenerator(RandomGenerator(seed: seed));

    final maxNumberOfObjectifGeneratedForEachProject = 5;

    return Project(
      id: seed,
      name: fakeData.company.name(),
      version: Version.faker(seed),
      listObjectif: List.generate(
        seed % maxNumberOfObjectifGeneratedForEachProject,
        (index) => Objectif.faker(index * seed),
      ),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

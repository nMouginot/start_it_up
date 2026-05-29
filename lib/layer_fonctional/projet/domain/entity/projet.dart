import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:faker/faker.dart';

part 'projet.g.dart';

@CopyWith()
class Projet {
  final int id;

  final String name;

  final String version;

  const Projet({
    required this.id,
    required this.name,
    required this.version,
  });

  factory Projet.faker({int seed = 1}) {
    final fakeData = Faker.withGenerator(RandomGenerator(seed: seed));
    final random = Random(seed);

    final majorVersionNumber = random.nextInt(10);
    final minorVersionNumber = random.nextInt(10);
    final patchVersionNumber = random.nextInt(10);

    return Projet(
      id: seed,
      name: fakeData.company.name(),
      version: "$majorVersionNumber.$minorVersionNumber.$patchVersionNumber",
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Projet && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

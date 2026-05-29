import 'dart:math';

import 'package:faker/faker.dart';

class Projet {
  final int id;

  final String name;

  final String version;

  const Projet({required this.id, required this.name, required this.version});

  factory Projet.faker([int seed = 1]) {
    final fakeData = Faker(seed: seed);

    final majorVersionNumber = Random(seed).nextInt(10);
    final minorVersionNumber = Random(seed + 1).nextInt(10);
    final patchVersionNumber = Random(seed + 2).nextInt(10);

    return Projet(
      id: seed,
      name: fakeData.company.name(),
      version: "$majorVersionNumber.$minorVersionNumber.$patchVersionNumber",
    );
  }
}

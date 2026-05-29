import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:faker/faker.dart';

import 'objectif_status.dart';

part 'objectif.g.dart';

@CopyWith()
class Objectif {
  final int id;

  final int projetId;

  final String title;

  final String description;

  final DateTime deadline;

  final ObjectifStatus status;

  const Objectif({
    required this.id,
    required this.projetId,
    required this.title,
    required this.description,
    required this.deadline,
    required this.status,
  });

  factory Objectif.faker({required int seed, required int projetId}) {
    final faker = Faker.withGenerator(RandomGenerator(seed: seed));
    final random = Random(seed);

    final daysFromNow = random.nextInt(28) - 7;
    final deadline = DateTime.now().add(Duration(days: daysFromNow));

    final status =
        ObjectifStatus.values[random.nextInt(ObjectifStatus.values.length)];

    return Objectif(
      id: seed,
      projetId: projetId,
      title: faker.lorem.sentence().replaceAll('.', ''),
      description: faker.lorem.sentences(2).join(' '),
      deadline: deadline,
      status: status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Objectif && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

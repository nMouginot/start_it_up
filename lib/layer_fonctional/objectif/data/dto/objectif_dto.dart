import 'dart:math';

import 'package:faker/faker.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/objectif.dart';

part 'objectif_dto.g.dart';

@JsonSerializable()
class ObjectifDto {
  final int id;
  final String title;
  final String description;
  final DateTime deadline;
  final ObjectifStatus status;

  const ObjectifDto({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.status,
  });

  factory ObjectifDto.faker([int seed = 1]) {
    final faker = Faker.withGenerator(RandomGenerator(seed: seed));
    final random = Random(seed);

    final daysFromNow = random.nextInt(28) - 7;
    final deadline = DateTime.now().add(Duration(days: daysFromNow));
    final status =
        ObjectifStatus.values[random.nextInt(ObjectifStatus.values.length)];

    return ObjectifDto(
      id: seed,
      title: faker.lorem.sentence().replaceAll('.', ''),
      description: faker.lorem.sentences(2).join(' '),
      deadline: deadline,
      status: status,
    );
  }

  factory ObjectifDto.fromJson(Map<String, dynamic> json) =>
      _$ObjectifDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectifDtoToJson(this);
}

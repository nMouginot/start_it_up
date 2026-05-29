import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../projet/domain/entity/projet.dart';

part 'projet_sprint_block.g.dart';

@JsonSerializable()
class ProjetSprintBlock {
  final Projet projet;

  final List<Objectif> objectifs;

  const ProjetSprintBlock({required this.projet, required this.objectifs});

  factory ProjetSprintBlock.fromJson(Map<String, dynamic> json) =>
      _$ProjetSprintBlockFromJson(json);

  Map<String, dynamic> toJson() => _$ProjetSprintBlockToJson(this);
}

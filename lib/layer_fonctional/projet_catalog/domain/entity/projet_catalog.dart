import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../projet/domain/entity/projet.dart';

part 'projet_catalog.g.dart';

@JsonSerializable()
class ProjetCatalog {
  final List<Projet> projets;

  final Map<int, List<Objectif>> objectifsByProjetId;

  const ProjetCatalog({
    required this.projets,
    required this.objectifsByProjetId,
  });

  factory ProjetCatalog.fromJson(Map<String, dynamic> json) =>
      _$ProjetCatalogFromJson(json);

  Map<String, dynamic> toJson() => _$ProjetCatalogToJson(this);

  Iterable<Objectif> get allObjectifs =>
      objectifsByProjetId.values.expand((list) => list);

  List<Objectif> objectifsOf(Projet projet) =>
      objectifsByProjetId[projet.id] ?? const [];
}

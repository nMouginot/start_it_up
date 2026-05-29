import '../../../objectif/domain/entity/objectif.dart';
import '../../../projet/domain/entity/projet.dart';

class ProjetCatalog {
  final List<Projet> projets;

  final Map<int, List<Objectif>> objectifsByProjetId;

  const ProjetCatalog({
    required this.projets,
    required this.objectifsByProjetId,
  });

  Iterable<Objectif> get allObjectifs =>
      objectifsByProjetId.values.expand((list) => list);

  List<Objectif> objectifsOf(Projet projet) =>
      objectifsByProjetId[projet.id] ?? const [];
}

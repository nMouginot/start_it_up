import '../../../objectif/domain/entity/objectif.dart';
import '../../../projet/domain/entity/projet.dart';

/// A projet bundled with the objectifs that fall in a sprint.
class ProjetSprintBlock {
  final Projet projet;

  final List<Objectif> objectifs;

  const ProjetSprintBlock({required this.projet, required this.objectifs});
}

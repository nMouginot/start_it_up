import '../../../../objectif/domain/entity/objectif.dart';
import '../../../domain/entity/projet.dart';

sealed class ProjetDetailState {
  const ProjetDetailState();
}

class ProjetDetailLoading extends ProjetDetailState {
  const ProjetDetailLoading();
}

class ProjetDetailLoaded extends ProjetDetailState {
  final Projet projet;
  final List<Objectif> objectifs;

  const ProjetDetailLoaded({required this.projet, required this.objectifs});
}

class ProjetDetailError extends ProjetDetailState {
  final Object error;

  const ProjetDetailError(this.error);
}

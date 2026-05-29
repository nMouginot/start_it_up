import '../../../domain/entity/projet.dart';

sealed class ProjetListState {
  const ProjetListState();
}

class ProjetListLoading extends ProjetListState {
  const ProjetListLoading();
}

class ProjetListLoaded extends ProjetListState {
  final List<Projet> projets;

  const ProjetListLoaded(this.projets);
}

class ProjetListError extends ProjetListState {
  final Object error;

  const ProjetListError(this.error);
}

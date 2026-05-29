import '../../data/repository/projet_repository.dart';
import '../entity/projet.dart';

class GetProjetByIdUseCase {
  final ProjetRepository _projetRepository;

  const GetProjetByIdUseCase({required ProjetRepository projetRepository})
    : _projetRepository = projetRepository;

  Future<Projet> execute(int id) => _projetRepository.fetchById(id);
}

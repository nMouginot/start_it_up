import '../../data/repository/projet_repository.dart';
import '../entity/projet.dart';

class GetProjetsUseCase {
  final ProjetRepository _projetRepository;

  const GetProjetsUseCase({required ProjetRepository projetRepository})
    : _projetRepository = projetRepository;

  Future<List<Projet>> execute() => _projetRepository.fetchAll();
}

import '../../data/repository/objectif_repository.dart';
import '../entity/objectif.dart';

class GetObjectifsByProjetUseCase {
  final ObjectifRepository _objectifRepository;

  const GetObjectifsByProjetUseCase({
    required ObjectifRepository objectifRepository,
  }) : _objectifRepository = objectifRepository;

  Future<List<Objectif>> execute(int projetId) async =>
      await _objectifRepository.fetchByProjetId(projetId);
}

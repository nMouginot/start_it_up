import '../../data/repository/objectif_repository.dart';
import '../entity/objectif.dart';

class GetObjectifsByProjectUseCase {
  final ObjectifRepository _objectifRepository;

  const GetObjectifsByProjectUseCase({
    required ObjectifRepository objectifRepository,
  }) : _objectifRepository = objectifRepository;

  Future<List<Objectif>> execute(int projectId) async =>
      await _objectifRepository.fetchByProjectId(projectId);
}

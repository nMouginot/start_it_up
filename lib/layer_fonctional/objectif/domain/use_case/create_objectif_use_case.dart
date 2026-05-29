import '../../data/repository/objectif_repository.dart';
import '../entity/objectif.dart';

class CreateObjectifUseCase {
  final ObjectifRepository _objectifRepository;

  const CreateObjectifUseCase({required ObjectifRepository objectifRepository})
    : _objectifRepository = objectifRepository;

  Future<Objectif> execute({
    required int projectId,
    required String title,
    required String description,
    required DateTime deadline,
  }) => _objectifRepository.create(
    projectId: projectId,
    title: title,
    description: description,
    deadline: deadline,
  );
}

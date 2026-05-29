import '../../data/repository/objectif_repository.dart';
import '../entity/objectif.dart';

class UpdateObjectifUseCase {
  final ObjectifRepository _objectifRepository;

  const UpdateObjectifUseCase({required ObjectifRepository objectifRepository})
    : _objectifRepository = objectifRepository;

  Future<Objectif> execute(Objectif objectif) async =>
      await _objectifRepository.update(objectif);
}

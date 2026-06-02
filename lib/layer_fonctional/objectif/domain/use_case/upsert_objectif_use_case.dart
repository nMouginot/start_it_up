import '../entity/objectif.dart';
import 'create_objectif_use_case.dart';
import 'update_objectif_use_case.dart';

class UpsertObjectifUseCase {
  final CreateObjectifUseCase _create;
  final UpdateObjectifUseCase _update;

  const UpsertObjectifUseCase({
    required CreateObjectifUseCase create,
    required UpdateObjectifUseCase update,
  }) : _create = create,
       _update = update;

  Future<Objectif> execute({
    Objectif? existing,
    int? projectId,
    required String title,
    required String description,
    required DateTime deadline,
  }) {
    if (existing != null) {
      return _update.execute(
        existing.copyWith(
          title: title,
          description: description,
          deadline: deadline,
        ),
      );
    }
    if (projectId == null) {
      throw ArgumentError('projectId is required to create an Objectif');
    }
    return _create.execute(
      projectId: projectId,
      title: title,
      description: description,
      deadline: deadline,
    );
  }
}

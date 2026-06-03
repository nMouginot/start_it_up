import '../entity/project.dart';
import 'create_project_use_case.dart';
import 'update_project_use_case.dart';

class UpsertProjectUseCase {
  final CreateProjectUseCase _create;
  final UpdateProjectUseCase _update;

  const UpsertProjectUseCase({
    required CreateProjectUseCase create,
    required UpdateProjectUseCase update,
  }) : _create = create,
       _update = update;

  Future<Project> execute({
    Project? existing,
    required String name,
    required String version,
  }) {
    if (existing != null) {
      return _update.execute(existing.copyWith(name: name, version: version));
    }
    return _create.execute(name: name, version: version);
  }
}

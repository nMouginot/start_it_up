import '../../../objectif/domain/use_case/get_objectifs_by_project_use_case.dart';
import '../../../project/domain/use_case/get_projects_use_case.dart';
import '../entity/project_catalog.dart';

class GetProjectCatalogUseCase {
  final GetProjectsUseCase _getProjectsUseCase;
  final GetObjectifsByProjectUseCase _getObjectifsByProjectUseCase;

  const GetProjectCatalogUseCase({
    required GetProjectsUseCase getProjectsUseCase,
    required GetObjectifsByProjectUseCase getObjectifsByProjectUseCase,
  }) : _getProjectsUseCase = getProjectsUseCase,
       _getObjectifsByProjectUseCase = getObjectifsByProjectUseCase;

  Future<ProjectCatalog> execute() async {
    final projects = await _getProjectsUseCase.execute();
    final entries = await Future.wait(
      projects.map((project) async {
        final objectifs = await _getObjectifsByProjectUseCase.execute(
          project.id,
        );
        return MapEntry(project.id, objectifs);
      }),
    );
    return ProjectCatalog(
      projects: projects,
      objectifsByProjectId: Map.fromEntries(entries),
    );
  }
}

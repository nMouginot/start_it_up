import '../../../project/domain/use_case/get_projects_use_case.dart';
import '../entity/project_catalog.dart';

class GetProjectCatalogUseCase {
  final GetProjectsUseCase _getProjectsUseCase;

  const GetProjectCatalogUseCase({required GetProjectsUseCase getProjectsUseCase})
    : _getProjectsUseCase = getProjectsUseCase;

  Future<ProjectCatalog> execute() async {
    final projects = await _getProjectsUseCase.execute();
    return ProjectCatalog(projects: projects);
  }
}

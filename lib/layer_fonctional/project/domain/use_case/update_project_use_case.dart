import '../../data/repository/project_repository.dart';
import '../entity/project.dart';

class UpdateProjectUseCase {
  final ProjectRepository _projectRepository;

  const UpdateProjectUseCase({required ProjectRepository projectRepository})
    : _projectRepository = projectRepository;

  Future<Project> execute(Project project) => _projectRepository.update(project);
}

import '../../data/repository/project_repository.dart';
import '../entity/project.dart';

class CreateProjectUseCase {
  final ProjectRepository _projectRepository;

  const CreateProjectUseCase({required ProjectRepository projectRepository})
    : _projectRepository = projectRepository;

  Future<Project> execute({
    required String name,
    required String version,
  }) => _projectRepository.create(name: name, version: version);
}

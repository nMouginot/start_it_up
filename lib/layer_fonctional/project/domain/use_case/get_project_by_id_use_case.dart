import '../../data/repository/project_repository.dart';
import '../entity/project.dart';

class GetProjectByIdUseCase {
  final ProjectRepository _projectRepository;

  const GetProjectByIdUseCase({required ProjectRepository projectRepository})
    : _projectRepository = projectRepository;

  Future<Project> execute(int id) => _projectRepository.fetchById(id);
}

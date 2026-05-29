import '../../data/repository/project_repository.dart';
import '../entity/project.dart';

class GetProjectsUseCase {
  final ProjectRepository _projectRepository;

  const GetProjectsUseCase({required ProjectRepository projectRepository})
    : _projectRepository = projectRepository;

  Future<List<Project>> execute() => _projectRepository.fetchAll();
}

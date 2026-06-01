import '../../../project/data/repository/project_repository.dart';
import '../../domain/entity/objectif.dart';
import '../dto/objectif_dto.dart';
import '../mapper/objectif_mapper.dart';

class ObjectifRepository {
  final ProjectRepository _projectRepository;
  int _nextCreatedId = 1000000;

  final ObjectifMapper _mapper = const ObjectifMapper();

  ObjectifRepository({required ProjectRepository projectRepository})
    : _projectRepository = projectRepository;

  Future<List<Objectif>> fetchByProjectId(int projectId) async {
    final project = await _projectRepository.fetchById(projectId);
    return project.listObjectif;
  }

  Future<Objectif> create({
    required int projectId,
    required String title,
    required String description,
    required DateTime deadline,
  }) async {
    final dto = ObjectifDto(
      id: _nextCreatedId++,
      title: title,
      description: description,
      deadline: deadline,
      status: ObjectifStatus.todo,
    );
    await _projectRepository.addObjectif(projectId: projectId, objectif: dto);
    return _mapper.convert<ObjectifDto, Objectif>(dto);
  }

  Future<Objectif> update(Objectif updated) async {
    final dto = _mapper.convert<Objectif, ObjectifDto>(updated);
    await _projectRepository.replaceObjectif(dto);
    return updated;
  }
}

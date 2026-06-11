import '../../../../layer_technical/version/data/dto/version_dto.dart';
import '../../../../layer_technical/version/domain/mapper/version_mapper.dart';
import '../../../../layer_technical/version/domain/version.dart';
import '../../../objectif/data/dto/objectif_dto.dart';
import '../../domain/entity/project.dart';
import '../dto/project_dto.dart';
import '../mapper/project_mapper.dart';

class ProjectRepository {
  static const int _seedCount = 8;

  final List<ProjectDto> _projects = [];
  bool _seeded = false;
  int _nextCreatedId = 1000000;

  final ProjectMapper _mapper = const ProjectMapper();
  final VersionMapper _versionMapper = const VersionMapper();

  void _seedIfNeeded() {
    if (_seeded) return;
    _seeded = true;
    for (var i = 1; i <= _seedCount; i++) {
      _projects.add(ProjectDto.faker(i));
    }
  }

  Future<List<Project>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _seedIfNeeded();
    return _mapper.convertList<ProjectDto, Project>(_projects);
  }

  Future<Project> fetchById(int id) async {
    await Future.delayed(const Duration(milliseconds: 250));
    _seedIfNeeded();
    final dto = _projects.where((p) => p.id == id).firstOrNull;
    if (dto == null) throw StateError('Project $id not found');
    return _mapper.convert<ProjectDto, Project>(dto);
  }

  Future<Project> create({
    required String name,
    required Version version,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final dto = ProjectDto(
      id: _nextCreatedId++,
      name: name,
      version: _versionMapper.convert(version),
      objectifs: const [],
    );
    _projects.add(dto);
    return _mapper.convert<ProjectDto, Project>(dto);
  }

  Future<Project> update(Project updated) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final index = _projects.indexWhere((p) => p.id == updated.id);
    if (index == -1) throw StateError('Project ${updated.id} not found');
    final replacement = _projects[index].copyWith(
      name: updated.name,
      version: _versionMapper.convert<Version, VersionDto>(updated.version),
    );
    _projects[index] = replacement;
    return _mapper.convert<ProjectDto, Project>(replacement);
  }

  Future<void> addObjectif({
    required int projectId,
    required ObjectifDto objectif,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final index = _projects.indexWhere((p) => p.id == projectId);
    if (index == -1) throw StateError('Project $projectId not found');
    final project = _projects[index];
    _projects[index] = project.copyWith(
      objectifs: [...project.objectifs, objectif],
    );
  }

  Future<void> replaceObjectif(ObjectifDto objectif) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final container = _projects
        .where((p) => p.objectifs.any((o) => o.id == objectif.id))
        .firstOrNull;
    if (container == null) {
      throw StateError('Objectif ${objectif.id} not found in any project');
    }
    final index = _projects.indexOf(container);
    final replaced = container.objectifs
        .map((o) => o.id == objectif.id ? objectif : o)
        .toList(growable: false);
    _projects[index] = container.copyWith(objectifs: replaced);
  }
}

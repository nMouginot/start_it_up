import '../../domain/entity/project.dart';

class ProjectRepository {
  static const int _seedCount = 8;

  final Map<int, Project> _overrides = {};

  /// Starts above the faker seed range to avoid collisions with seeded ids.
  int _nextCreatedId = 1000000;

  Future<List<Project>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 400));
    final fakerIds = <int>{};
    final fakerProjects = List.generate(_seedCount, (index) {
      final seed = index + 1;
      fakerIds.add(seed);
      return _overrides[seed] ?? Project.faker(seed: seed);
    });
    final extras = _overrides.values.where(
      (project) => !fakerIds.contains(project.id),
    );
    return [...fakerProjects, ...extras];
  }

  Future<Project> fetchById(int id) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return _overrides[id] ?? Project.faker(seed: id);
  }

  Future<Project> create({
    required String name,
    required String version,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final project = Project(
      id: _nextCreatedId++,
      name: name,
      version: version,
    );
    _overrides[project.id] = project;
    return project;
  }

  Future<Project> update(Project updated) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _overrides[updated.id] = updated;
    return updated;
  }
}

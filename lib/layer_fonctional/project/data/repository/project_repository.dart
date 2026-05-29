import '../../domain/entity/project.dart';

/// Placeholder data source for Project.
///
/// Backed by faker until a real API is available.
class ProjectRepository {
  static const int _seedCount = 8;

  Future<List<Project>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return List.generate(_seedCount, (index) => Project.faker(seed: index + 1));
  }

  Future<Project> fetchById(int id) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return Project.faker(seed: id);
  }
}

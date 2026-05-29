import '../../domain/entity/projet.dart';

/// Placeholder data source for Projet.
///
/// Backed by faker until a real API is available.
class ProjetRepository {
  static const int _seedCount = 8;

  Future<List<Projet>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return List.generate(_seedCount, (index) => Projet.faker(seed: index + 1));
  }

  Future<Projet> fetchById(int id) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return Projet.faker(seed: id);
  }
}

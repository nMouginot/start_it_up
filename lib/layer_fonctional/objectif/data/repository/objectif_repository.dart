import '../../domain/entity/objectif.dart';

/// Placeholder data source for Objectif.
///
/// Backed by faker until a real API is available. Each projet gets a
/// deterministic set of objectifs based on its id, so navigating back and
/// forth shows stable data.
class ObjectifRepository {
  static const int _objectifsPerProjet = 4;

  Future<List<Objectif>> fetchByProjetId(int projetId) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return List.generate(_objectifsPerProjet, (index) {
      final seed = projetId * 100 + index + 1;
      return Objectif.faker(seed: seed, projetId: projetId);
    });
  }
}

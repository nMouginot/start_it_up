import '../../domain/entity/objectif.dart';
import '../../domain/entity/objectif_status.dart';

/// Placeholder data source for Objectif.
///
/// Backed by faker for the existing catalog, plus an in-memory store for
/// objectifs created at runtime through the form. The whole shape stays
/// behind the same async interface so a real API can replace it later
/// without touching the use cases.
class ObjectifRepository {
  static const int _objectifsPerProjet = 4;

  /// Created-at-runtime objectifs, indexed by their parent projet's id.
  final Map<int, List<Objectif>> _createdByProjetId = {};

  /// Monotonic id source for created objectifs.
  /// Starts well above the faker seed range to avoid collisions.
  int _nextCreatedId = 1000000;

  Future<List<Objectif>> fetchByProjetId(int projetId) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final fakerObjectifs = List.generate(_objectifsPerProjet, (index) {
      final seed = projetId * 100 + index + 1;
      return Objectif.faker(seed: seed, projetId: projetId);
    });
    final created = _createdByProjetId[projetId] ?? const [];
    return [...fakerObjectifs, ...created];
  }

  Future<Objectif> create({
    required int projetId,
    required String title,
    required String description,
    required DateTime deadline,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final objectif = Objectif(
      id: _nextCreatedId++,
      projetId: projetId,
      title: title,
      description: description,
      deadline: deadline,
      status: ObjectifStatus.todo,
    );
    final list = _createdByProjetId.putIfAbsent(projetId, () => []);
    list.add(objectif);
    return objectif;
  }
}

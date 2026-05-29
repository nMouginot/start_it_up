import '../../domain/entity/objectif.dart';
import '../../domain/entity/objectif_status.dart';

/// Placeholder data source for Objectif.
///
/// Backed by faker for the base catalog, plus an in-memory override store
/// so the user can create new objectifs and edit existing ones. Editing a
/// faker objectif places a copy into the store that subsequent fetches pick
/// up, transparently overriding the seed-generated value.
class ObjectifRepository {
  static const int _objectifsPerProjet = 4;

  /// Override / created objectifs, indexed by their id.
  final Map<int, Objectif> _overrides = {};

  /// Monotonic id source for created objectifs.
  /// Starts well above the faker seed range to avoid collisions.
  int _nextCreatedId = 1000000;

  Future<List<Objectif>> fetchByProjetId(int projetId) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final fakerIds = <int>{};
    final fakerObjectifs = List.generate(_objectifsPerProjet, (index) {
      final seed = projetId * 100 + index + 1;
      fakerIds.add(seed);
      return _overrides[seed] ?? Objectif.faker(seed: seed, projetId: projetId);
    });
    final extras = _overrides.values.where(
      (objectif) =>
          objectif.projetId == projetId && !fakerIds.contains(objectif.id),
    );
    return [...fakerObjectifs, ...extras];
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
    _overrides[objectif.id] = objectif;
    return objectif;
  }

  Future<Objectif> update(Objectif updated) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _overrides[updated.id] = updated;
    return updated;
  }
}

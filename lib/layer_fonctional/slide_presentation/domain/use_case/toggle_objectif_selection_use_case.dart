import '../../../objectif/domain/entity/objectif.dart';

class ToggleObjectifSelectionUseCase {
  const ToggleObjectifSelectionUseCase();

  List<Objectif> execute({
    required List<Objectif> current,
    required Objectif objectif,
  }) {
    final next = List<Objectif>.from(current);
    if (next.any((o) => o.id == objectif.id)) {
      next.removeWhere((o) => o.id == objectif.id);
    } else {
      next.add(objectif);
    }
    return next;
  }
}

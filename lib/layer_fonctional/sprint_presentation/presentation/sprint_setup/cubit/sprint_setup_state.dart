import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../projet_catalog/domain/entity/projet_catalog.dart';
import '../../../domain/entity/sprint_presentation.dart';
import '../../../domain/entity/sprint_timeframe.dart';

part 'sprint_setup_state.g.dart';

@CopyWith()
class SprintSetupState {
  final bool catalogLoading;
  final ProjetCatalog? catalog;
  final Set<int> selectedObjectifIds;
  final SprintTimeframe timeframe;
  final bool building;
  final SprintPresentation? builtPresentation;
  final Object? error;

  const SprintSetupState({
    required this.catalogLoading,
    required this.catalog,
    required this.selectedObjectifIds,
    required this.timeframe,
    required this.building,
    required this.builtPresentation,
    required this.error,
  });

  factory SprintSetupState.initial() => SprintSetupState(
    catalogLoading: true,
    catalog: null,
    selectedObjectifIds: const {},
    timeframe: SprintTimeframe.currentWeek(),
    building: false,
    builtPresentation: null,
    error: null,
  );

  bool get hasValidTimeframe => !timeframe.end.isBefore(timeframe.start);

  bool get canGenerate =>
      !building && selectedObjectifIds.isNotEmpty && hasValidTimeframe;

  bool get canLaunch => builtPresentation != null && !building;

  /// Number of distinct projets touched by the current objectif selection.
  int get selectedProjetCount {
    final catalog = this.catalog;
    if (catalog == null) return 0;
    final projetIds = <int>{};
    for (final projet in catalog.projets) {
      final hasSelected = catalog
          .objectifsOf(projet)
          .any((objectif) => selectedObjectifIds.contains(objectif.id));
      if (hasSelected) projetIds.add(projet.id);
    }
    return projetIds.length;
  }
}

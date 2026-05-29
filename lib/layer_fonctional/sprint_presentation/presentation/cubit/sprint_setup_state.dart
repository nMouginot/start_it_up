import '../../../projet_catalog/domain/entity/projet_catalog.dart';
import '../../domain/entity/sprint_presentation.dart';
import '../../domain/entity/sprint_timeframe.dart';

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

  SprintSetupState copyWith({
    bool? catalogLoading,
    ProjetCatalog? catalog,
    Set<int>? selectedObjectifIds,
    SprintTimeframe? timeframe,
    bool? building,
    SprintPresentation? builtPresentation,
    bool clearBuiltPresentation = false,
    Object? error,
    bool clearError = false,
  }) => SprintSetupState(
    catalogLoading: catalogLoading ?? this.catalogLoading,
    catalog: catalog ?? this.catalog,
    selectedObjectifIds: selectedObjectifIds ?? this.selectedObjectifIds,
    timeframe: timeframe ?? this.timeframe,
    building: building ?? this.building,
    builtPresentation: clearBuiltPresentation
        ? null
        : builtPresentation ?? this.builtPresentation,
    error: clearError ? null : error ?? this.error,
  );
}

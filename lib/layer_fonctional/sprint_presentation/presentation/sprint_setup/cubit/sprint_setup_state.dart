import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../project_catalog/domain/entity/project_catalog.dart';
import '../../../domain/entity/sprint_presentation.dart';
import '../../../domain/entity/sprint_timeframe.dart';

part 'sprint_setup_state.g.dart';

@CopyWith()
class SprintSetupState {
  final bool catalogLoading;
  final ProjectCatalog? catalog;
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

  int get selectedProjectCount {
    final catalog = this.catalog;
    if (catalog == null) return 0;
    final projectIds = <int>{};
    for (final project in catalog.projects) {
      final hasSelected = catalog
          .objectifsOf(project)
          .any((objectif) => selectedObjectifIds.contains(objectif.id));
      if (hasSelected) projectIds.add(project.id);
    }
    return projectIds.length;
  }
}

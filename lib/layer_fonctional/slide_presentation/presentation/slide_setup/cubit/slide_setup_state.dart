import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../../project_catalog/domain/entity/project_catalog.dart';
import '../../../domain/entity/slide_presentation.dart';
import '../../../domain/entity/slide_timeframe.dart';

part 'slide_setup_state.g.dart';

@CopyWith()
class SlideSetupState {
  final bool catalogLoading;
  final ProjectCatalog? catalog;
  final List<Objectif> listSelectedObjectif;
  final SlideTimeframe timeframe;
  final bool building;
  final SlidePresentation? builtPresentation;
  final Object? error;

  const SlideSetupState({
    required this.catalogLoading,
    required this.catalog,
    required this.listSelectedObjectif,
    required this.timeframe,
    required this.building,
    required this.builtPresentation,
    required this.error,
  });

  factory SlideSetupState.initial() => SlideSetupState(
    catalogLoading: true,
    catalog: null,
    listSelectedObjectif: const [],
    timeframe: SlideTimeframe.currentWeek(),
    building: false,
    builtPresentation: null,
    error: null,
  );

  bool get hasValidTimeframe => !timeframe.end.isBefore(timeframe.start);

  bool get canGenerate =>
      !building && listSelectedObjectif.isNotEmpty && hasValidTimeframe;

  bool get canLaunch => builtPresentation != null && !building;

  int get selectedProjectCount {
    final catalog = this.catalog;
    if (catalog == null) return 0;
    final projectIds = <int>{};
    for (final project in catalog.projects) {
      final hasSelected = catalog
          .objectifsOf(project)
          .any((objectif) => listSelectedObjectif.contains(objectif.id));
      if (hasSelected) projectIds.add(project.id);
    }
    return projectIds.length;
  }
}

import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../../project/domain/entity/project.dart';
import '../../../../theme/domain/entity/slide_theme.dart';
import '../../../domain/entity/slide_presentation.dart';
import '../../../domain/entity/timeframe.dart';

part 'slide_setup_state.g.dart';

@CopyWith()
class SlideSetupState {
  final bool projectsLoading;
  final List<Project> projects;
  final List<Objectif> listSelectedObjectif;
  final Timeframe timeframe;
  final SlideTheme theme;
  final bool building;
  final SlidePresentation? builtPresentation;
  final Object? error;

  const SlideSetupState({
    required this.projectsLoading,
    required this.projects,
    required this.listSelectedObjectif,
    required this.timeframe,
    required this.theme,
    required this.building,
    required this.builtPresentation,
    required this.error,
  });

  factory SlideSetupState.initial() => SlideSetupState(
    projectsLoading: true,
    projects: const [],
    listSelectedObjectif: const [],
    timeframe: Timeframe.currentWeek(),
    theme: const SlideTheme.defaults(),
    building: false,
    builtPresentation: null,
    error: null,
  );

  bool get hasValidTimeframe => !timeframe.end.isBefore(timeframe.start);

  bool get canGenerate =>
      !building && listSelectedObjectif.isNotEmpty && hasValidTimeframe;

  bool get canLaunch => builtPresentation != null && !building;

  int get selectedProjectCount {
    final selectedIds = listSelectedObjectif.map((o) => o.id).toSet();
    final projectIds = <int>{};
    for (final project in projects) {
      final hasSelected = project.listObjectif.any(
        (o) => selectedIds.contains(o.id),
      );
      if (hasSelected) projectIds.add(project.id);
    }
    return projectIds.length;
  }
}

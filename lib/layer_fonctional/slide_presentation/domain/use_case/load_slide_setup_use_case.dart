import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../project/domain/use_case/get_projects_use_case.dart';
import '../../../slide_presentation_history/domain/use_case/get_slide_presentation_history_use_case.dart';
import '../entity/project_slide_block.dart';
import '../entity/slide_presentation.dart';
import '../entity/slide_timeframe.dart';
import '../entity/timeframe.dart';

typedef LoadSlideSetupResult = ({
  List<Project> projects,
  Timeframe? timeframe,
  List<Objectif> preselectedObjectifs,
  SlidePresentation? existingPresentation,
});

class LoadSlideSetupUseCase {
  final GetProjectsUseCase _getProjectsUseCase;
  final GetSlidePresentationHistoryUseCase _getHistoryUseCase;

  const LoadSlideSetupUseCase({
    required GetProjectsUseCase getProjectsUseCase,
    required GetSlidePresentationHistoryUseCase getHistoryUseCase,
  }) : _getProjectsUseCase = getProjectsUseCase,
       _getHistoryUseCase = getHistoryUseCase;

  Future<LoadSlideSetupResult> execute({int? historyEntryId}) async {
    final projects = await _getProjectsUseCase.execute();
    if (historyEntryId == null) {
      return (
        projects: projects,
        timeframe: null,
        preselectedObjectifs: const <Objectif>[],
        existingPresentation: null,
      );
    }
    final entries = await _getHistoryUseCase.execute();
    final entry = entries.where((e) => e.id == historyEntryId).firstOrNull;
    if (entry == null) {
      return (
        projects: projects,
        timeframe: null,
        preselectedObjectifs: const <Objectif>[],
        existingPresentation: null,
      );
    }
    final presentation = entry.presentation;
    final intro = presentation.slides.whereType<SlideTimeframe>().firstOrNull;
    final selected = presentation.slides
        .whereType<ProjectSlideBlock>()
        .expand((block) => block.objectifs)
        .toList(growable: false);
    return (
      projects: projects,
      timeframe: intro == null
          ? null
          : Timeframe(start: intro.start, end: intro.end),
      preselectedObjectifs: selected,
      existingPresentation: presentation,
    );
  }
}

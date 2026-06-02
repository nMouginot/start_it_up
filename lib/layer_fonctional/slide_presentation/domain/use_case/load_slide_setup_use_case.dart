import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../project/domain/use_case/get_projects_use_case.dart';
import '../entity/project_slide_block.dart';
import '../entity/slide_presentation.dart';
import '../entity/slide_timeframe.dart';
import '../entity/timeframe.dart';
import 'get_slide_presentation_history_by_id_use_case.dart';

typedef LoadSlideSetupResult = ({
  List<Project> projects,
  Timeframe? timeframe,
  List<Objectif> preselectedObjectifs,
  SlidePresentation? existingPresentation,
});

class LoadSlideSetupUseCase {
  final GetProjectsUseCase _getProjectsUseCase;
  final GetSlidePresentationHistoryByIdUseCase _getHistoryByIdUseCase;

  const LoadSlideSetupUseCase({
    required GetProjectsUseCase getProjectsUseCase,
    required GetSlidePresentationHistoryByIdUseCase getHistoryByIdUseCase,
  }) : _getProjectsUseCase = getProjectsUseCase,
       _getHistoryByIdUseCase = getHistoryByIdUseCase;

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
    final dto = await _getHistoryByIdUseCase.execute(historyEntryId);
    if (dto == null) {
      return (
        projects: projects,
        timeframe: null,
        preselectedObjectifs: const <Objectif>[],
        existingPresentation: null,
      );
    }
    final presentation = dto.presentation;
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

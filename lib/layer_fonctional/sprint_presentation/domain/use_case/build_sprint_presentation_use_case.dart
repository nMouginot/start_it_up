import '../../../project_catalog/domain/entity/project_catalog.dart';
import '../entity/project_sprint_block.dart';
import '../entity/sprint_presentation.dart';
import '../entity/sprint_timeframe.dart';

class BuildSprintPresentationUseCase {
  const BuildSprintPresentationUseCase();

  Future<SprintPresentation> execute({
    required SprintTimeframe timeframe,
    required ProjectCatalog catalog,
    required Set<int> selectedObjectifIds,
  }) async {
    final blocks = <ProjectSprintBlock>[];
    for (final project in catalog.projects) {
      final selected = catalog
          .objectifsOf(project)
          .where((objectif) => selectedObjectifIds.contains(objectif.id))
          .toList(growable: false);
      if (selected.isEmpty) continue;
      blocks.add(ProjectSprintBlock(project: project, objectifs: selected));
    }
    return SprintPresentation(timeframe: timeframe, blocks: blocks);
  }
}

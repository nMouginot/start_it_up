import '../../../project_catalog/domain/entity/project_catalog.dart';
import '../entity/project_slide_block.dart';
import '../entity/slide_presentation.dart';
import '../entity/slide_timeframe.dart';

class BuildSlidePresentationUseCase {
  const BuildSlidePresentationUseCase();

  Future<SlidePresentation> execute({
    required SlideTimeframe timeframe,
    required ProjectCatalog catalog,
    required Set<int> selectedObjectifIds,
  }) async {
    final blocks = <ProjectSlideBlock>[];
    for (final project in catalog.projects) {
      final selected = catalog
          .objectifsOf(project)
          .where((objectif) => selectedObjectifIds.contains(objectif.id))
          .toList(growable: false);
      if (selected.isEmpty) continue;
      blocks.add(ProjectSlideBlock(project: project, objectifs: selected));
    }
    return SlidePresentation(timeframe: timeframe, blocks: blocks);
  }
}

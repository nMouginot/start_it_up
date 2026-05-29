import '../../../projet_catalog/domain/entity/projet_catalog.dart';
import '../entity/projet_sprint_block.dart';
import '../entity/sprint_presentation.dart';
import '../entity/sprint_timeframe.dart';

class BuildSprintPresentationUseCase {
  const BuildSprintPresentationUseCase();

  /// Groups the selected objectifs by their parent projet, keeping only the
  /// projets that have at least one selected objectif, in the order they
  /// appear in [catalog].
  Future<SprintPresentation> execute({
    required SprintTimeframe timeframe,
    required ProjetCatalog catalog,
    required Set<int> selectedObjectifIds,
  }) async {
    final blocks = <ProjetSprintBlock>[];
    for (final projet in catalog.projets) {
      final selected = catalog
          .objectifsOf(projet)
          .where((objectif) => selectedObjectifIds.contains(objectif.id))
          .toList(growable: false);
      if (selected.isEmpty) continue;
      blocks.add(ProjetSprintBlock(projet: projet, objectifs: selected));
    }
    return SprintPresentation(timeframe: timeframe, blocks: blocks);
  }
}

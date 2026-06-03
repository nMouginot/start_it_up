import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../project_slide_block/domain/entity/project_slide_block.dart';
import '../../../slide_overview/domain/entity/slide_overview.dart';
import '../../../slide_timeframe/domain/entity/slide_timeframe.dart';
import '../entity/slide.dart';
import '../entity/slide_presentation.dart';
import '../entity/timeframe.dart';

class BuildSlidePresentationUseCase {
  const BuildSlidePresentationUseCase();

  Future<SlidePresentation> execute({
    required Timeframe timeframe,
    required List<Project> projects,
    required List<Objectif> selectedObjectif,
  }) async {
    final selectedIds = selectedObjectif.map((o) => o.id).toSet();

    final blocks = <(Project, List<Objectif>)>[];
    for (final project in projects) {
      final selected = project.listObjectif
          .where((o) => selectedIds.contains(o.id))
          .toList(growable: false);
      if (selected.isEmpty) continue;
      blocks.add((project, selected));
    }

    final doneCount = selectedObjectif
        .where((o) => o.status == ObjectifStatus.done)
        .length;
    final failedCount = selectedObjectif
        .where((o) => o.status == ObjectifStatus.failed)
        .length;
    final blockedCount = selectedObjectif
        .where((o) => o.status == ObjectifStatus.blocked)
        .length;

    final totalPages = 2 + blocks.length;

    final slides = <Slide>[
      SlideTimeframe(
        pageNumber: 1,
        totalPages: totalPages,
        timeframe: timeframe,
      ),
      SlideOverview(
        pageNumber: 2,
        totalPages: totalPages,
        timeframe: timeframe,
        totalProjects: blocks.length,
        totalObjectifs: selectedObjectif.length,
        doneCount: doneCount,
        failedCount: failedCount,
        blockedCount: blockedCount,
      ),
      for (final (index, block) in blocks.indexed)
        ProjectSlideBlock(
          pageNumber: 3 + index,
          totalPages: totalPages,
          timeframe: timeframe,
          project: block.$1,
          objectifs: block.$2,
        ),
    ];

    return SlidePresentation(slides: slides);
  }
}

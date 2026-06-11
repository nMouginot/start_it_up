import '../../../objectif/domain/entity/objectif.dart';
import '../../../project_slide_block/domain/entity/project_slide_block.dart';
import '../../../slide_overview/domain/entity/slide_overview.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../entity/slide.dart';
import '../entity/slide_presentation.dart';
import '../entity/timeframe.dart';

class BuildSlidePresentationUseCase {
  const BuildSlidePresentationUseCase();

  Future<SlidePresentation> execute({
    required List<Slide> slides,
    required Timeframe timeframe,
    required SlideTheme theme,
  }) async {
    final totalPages = slides.length;
    final projectBlocks = slides.whereType<ProjectSlideBlock>().toList();
    final allEntries = projectBlocks.expand((block) => block.entries).toList();
    final allObjectifs = allEntries.expand((e) => e.objectifs).toList();
    final totalProjects = allEntries.map((e) => e.project.id).toSet().length;
    final totalObjectifs = allObjectifs.length;
    final doneCount = allObjectifs
        .where((o) => o.status == ObjectifStatus.done)
        .length;
    final failedCount = allObjectifs
        .where((o) => o.status == ObjectifStatus.failed)
        .length;
    final blockedCount = allObjectifs
        .where((o) => o.status == ObjectifStatus.blocked)
        .length;

    final rebuilt = <Slide>[];
    for (var i = 0; i < slides.length; i++) {
      final slide = slides[i];
      var renumbered = slide.copyWithCore(
        pageNumber: i + 1,
        totalPages: totalPages,
        timeframe: timeframe,
        theme: theme,
      );
      if (renumbered is SlideOverview) {
        renumbered = renumbered.copyWithMetrics(
          totalProjects: totalProjects,
          totalObjectifs: totalObjectifs,
          doneCount: doneCount,
          failedCount: failedCount,
          blockedCount: blockedCount,
        );
      }
      rebuilt.add(renumbered);
    }

    return SlidePresentation(slides: rebuilt, theme: theme);
  }
}

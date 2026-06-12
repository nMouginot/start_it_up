import '../../../project_slide_block/domain/entity/project_slide_block.dart';
import '../../../project_slide_block/domain/entity/project_slide_entry.dart';
import '../../../slide_overview/domain/entity/slide_overview.dart';
import '../../../slide_timeframe/domain/entity/slide_intro.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../domain/entity/slide.dart';
import '../../domain/entity/slide_presentation.dart';
import '../../domain/entity/timeframe.dart';

/// Serializes a [SlidePresentation] to a minimal JSON seed and reconstructs it.
///
/// The slides are Flutter widgets, so we never serialize them directly. Instead
/// we store the shared `theme`/`timeframe` once plus, per slide, its
/// discriminating `templateKey`, `instanceId` and the few fields that are not
/// derivable. Page numbers are recomputed from order on the way back, mirroring
/// [BuildSlidePresentationUseCase].
Map<String, dynamic> slidePresentationToJson(SlidePresentation presentation) {
  return {
    'theme': presentation.theme.toJson(),
    'timeframe': presentation.slides.firstOrNull?.timeframe.toJson(),
    'slides': presentation.slides.map(_slideToJson).toList(),
  };
}

SlidePresentation slidePresentationFromJson(Map<String, dynamic> json) {
  final theme = SlideTheme.fromJson(json['theme'] as Map<String, dynamic>);
  final timeframeJson = json['timeframe'] as Map<String, dynamic>?;
  final timeframe = timeframeJson == null
      ? null
      : Timeframe.fromJson(timeframeJson);
  final rawSlides = (json['slides'] as List<dynamic>)
      .cast<Map<String, dynamic>>();
  final totalPages = rawSlides.length;

  final slides = <Slide>[];
  for (var index = 0; index < rawSlides.length; index++) {
    final slide = _slideFromJson(
      rawSlides[index],
      pageNumber: index + 1,
      totalPages: totalPages,
      timeframe: timeframe,
      theme: theme,
    );
    if (slide != null) slides.add(slide);
  }

  return SlidePresentation(slides: slides, theme: theme);
}

Map<String, dynamic> _slideToJson(Slide slide) {
  final base = {'type': slide.templateKey, 'instanceId': slide.instanceId};
  return switch (slide) {
    SlideOverview overview => {
      ...base,
      'totalProjects': overview.totalProjects,
      'totalObjectifs': overview.totalObjectifs,
      'doneCount': overview.doneCount,
      'failedCount': overview.failedCount,
      'blockedCount': overview.blockedCount,
    },
    ProjectSlideBlock block => {
      ...base,
      'entries': block.entries.map((entry) => entry.toJson()).toList(),
    },
    _ => base,
  };
}

/// Returns `null` for an unknown `type` so older/newer payloads degrade
/// gracefully instead of crashing the whole history.
Slide? _slideFromJson(
  Map<String, dynamic> json, {
  required int pageNumber,
  required int totalPages,
  required Timeframe? timeframe,
  required SlideTheme theme,
}) {
  final type = json['type'] as String;
  final instanceId = json['instanceId'] as String;

  return switch (type) {
    SlideTimeframe.templateKeyValue => SlideTimeframe(
      instanceId: instanceId,
      pageNumber: pageNumber,
      totalPages: totalPages,
      timeframe: timeframe!,
      theme: theme,
    ),
    SlideOverview.templateKeyValue => SlideOverview(
      instanceId: instanceId,
      pageNumber: pageNumber,
      totalPages: totalPages,
      timeframe: timeframe!,
      theme: theme,
      totalProjects: json['totalProjects'] as int,
      totalObjectifs: json['totalObjectifs'] as int,
      doneCount: json['doneCount'] as int,
      failedCount: json['failedCount'] as int,
      blockedCount: json['blockedCount'] as int,
    ),
    ProjectSlideBlock.templateKeyValue => ProjectSlideBlock(
      instanceId: instanceId,
      pageNumber: pageNumber,
      totalPages: totalPages,
      timeframe: timeframe!,
      theme: theme,
      entries: (json['entries'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(ProjectSlideEntry.fromJson)
          .toList(),
    ),
    _ => null,
  };
}

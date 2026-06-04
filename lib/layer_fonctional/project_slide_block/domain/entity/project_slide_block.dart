import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../slide_presentation/domain/entity/slide_instance_id.dart';
import '../../../slide_presentation/domain/entity/slide_template.dart';
import '../../../slide_presentation/domain/entity/timeframe.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_shell.dart';
import '../../presentation/widget/project_card.dart';
import '../../presentation/widget/project_slide_block_settings.dart';
import 'project_slide_entry.dart';

class ProjectSlideBlock extends Slide {
  final List<ProjectSlideEntry> entries;

  factory ProjectSlideBlock({
    Key? key,
    String? instanceId,
    int pageNumber = 1,
    int totalPages = 1,
    required Timeframe timeframe,
    required SlideTheme theme,
    List<ProjectSlideEntry> entries = const [],
  }) => ProjectSlideBlock._(
    key: key,
    instanceId: instanceId ?? newSlideInstanceId(),
    pageNumber: pageNumber,
    totalPages: totalPages,
    timeframe: timeframe,
    theme: theme,
    entries: entries,
  );

  ProjectSlideBlock._({
    super.key,
    required super.instanceId,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required super.theme,
    required this.entries,
  }) : super(
         configuration: FlutterDeckSlideConfiguration(
           route: '/project-$instanceId',
         ),
       );

  static const String templateKeyValue = 'project_block';

  static SlideTemplate template = SlideTemplate(
    key: templateKeyValue,
    label: 'Projets',
    icon: Icons.folder,
    createDefault: ({required timeframe, required theme}) =>
        ProjectSlideBlock(timeframe: timeframe, theme: theme),
  );

  @override
  String get templateKey => templateKeyValue;

  @override
  String get summary => entries.isEmpty
      ? 'Aucun projet sélectionné'
      : entries
            .map((e) => '${e.project.name} (${e.objectifs.length})')
            .join(' • ');

  @override
  ProjectSlideBlock copyWithCore({
    int? pageNumber,
    int? totalPages,
    Timeframe? timeframe,
    SlideTheme? theme,
  }) => ProjectSlideBlock._(
    instanceId: instanceId,
    pageNumber: pageNumber ?? this.pageNumber,
    totalPages: totalPages ?? this.totalPages,
    timeframe: timeframe ?? this.timeframe,
    theme: theme ?? this.theme,
    entries: entries,
  );

  ProjectSlideBlock copyWithEntries({required List<ProjectSlideEntry> entries}) =>
      ProjectSlideBlock._(
        instanceId: instanceId,
        pageNumber: pageNumber,
        totalPages: totalPages,
        timeframe: timeframe,
        theme: theme,
        entries: entries,
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (_) => SlideShell(
        theme: theme,
        pageNumber: pageNumber,
        totalPages: totalPages,
        child: entries.isEmpty
            ? Center(
                child: Text(
                  'Aucun projet sélectionné',
                  style: theme.headline(),
                ),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  const gap = 24.0;
                  final cardWidth = (constraints.maxWidth - gap) / 2;
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: gap,
                      runSpacing: gap,
                      children: [
                        for (final entry in entries)
                          SizedBox(
                            width: cardWidth,
                            child: ProjectCard(entry: entry, theme: theme),
                          ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  @override
  Widget buildSettings(BuildContext context, ValueChanged<Slide> onChanged) {
    return ProjectSlideBlockSettings(slide: this, onChanged: onChanged);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_shell.dart';

class ProjectSlideBlock extends Slide {
  final Project project;
  final List<Objectif> objectifs;

  ProjectSlideBlock({
    super.key,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required super.theme,
    required this.project,
    required this.objectifs,
  }) : super(
         configuration: FlutterDeckSlideConfiguration(
           route: '/project-${project.id}',
         ),
       );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (_) => SlideShell(
        theme: theme,
        pageNumber: pageNumber,
        totalPages: totalPages,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: theme.display()),
            const SizedBox(height: 8),
            Text(
              'Version ${project.version}',
              style: theme.title(color: theme.colors.accentColor),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: objectifs.isEmpty
                  ? Center(
                      child: Text(
                        'Aucun objectif pour ce sprint.',
                        style: theme.body(),
                      ),
                    )
                  : ListView.separated(
                      itemCount: objectifs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, index) => _ObjectifRow(
                        theme: theme,
                        objectif: objectifs[index],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ObjectifRow extends StatelessWidget {
  final SlideTheme theme;
  final Objectif objectif;

  const _ObjectifRow({required this.theme, required this.objectif});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(objectif.title, style: theme.title()),
          const SizedBox(height: 4),
          Text(objectif.description, style: theme.body()),
          const SizedBox(height: 8),
          Row(
            children: [
              _Badge(theme: theme, label: objectif.status.label),
              const SizedBox(width: 8),
              _Badge(
                theme: theme,
                label: 'Échéance : ${objectif.deadline.formattedDayMonth}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final SlideTheme theme;
  final String label;
  const _Badge({required this.theme, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colors.primaryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: theme.body(color: theme.colors.primaryColor)),
    );
  }
}

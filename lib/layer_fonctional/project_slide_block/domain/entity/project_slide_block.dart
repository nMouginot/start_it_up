import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../slide_presentation/domain/entity/slide.dart';

class ProjectSlideBlock extends Slide {
  final Project project;
  final List<Objectif> objectifs;

  ProjectSlideBlock({
    super.key,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required this.project,
    required this.objectifs,
  }) : super(
         configuration: FlutterDeckSlideConfiguration(
           route: '/project-${project.id}',
         ),
       );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: theme.textTheme.displaySmall),
            const SizedBox(height: 8),
            Text(
              'Version ${project.version}',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: objectifs.isEmpty
                  ? const Center(child: Text('Aucun objectif pour ce sprint.'))
                  : ListView.separated(
                      itemCount: objectifs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, index) =>
                          _ObjectifRow(objectif: objectifs[index]),
                    ),
            ),
            const SizedBox(height: 16),
            Text(
              '$pageNumber / $totalPages',
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _ObjectifRow extends StatelessWidget {
  final Objectif objectif;

  const _ObjectifRow({required this.objectif});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(objectif.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(objectif.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              _Badge(label: objectif.status.label),
              const SizedBox(width: 8),
              _Badge(
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
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: theme.textTheme.labelMedium),
    );
  }
}

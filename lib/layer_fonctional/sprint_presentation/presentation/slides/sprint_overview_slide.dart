import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../objectif/domain/entity/objectif_status.dart';
import '../../domain/entity/sprint_presentation.dart';

class SprintOverviewSlide extends FlutterDeckSlideWidget {
  final SprintPresentation presentation;

  const SprintOverviewSlide({super.key, required this.presentation})
    : super(
        configuration: const FlutterDeckSlideConfiguration(route: '/overview'),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = Theme.of(context);
    final done = presentation.allObjectifs
        .where((objectif) => objectif.status == ObjectifStatus.failed)
        .length;
    final inProgress = presentation.allObjectifs
        .where((objectif) => objectif.status == ObjectifStatus.done)
        .length;
    final blocked = presentation.allObjectifs
        .where((objectif) => objectif.status == ObjectifStatus.blocked)
        .length;

    return FlutterDeckSlide.blank(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vue d'ensemble", style: theme.textTheme.displaySmall),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _MetricCard(label: 'Projets', value: presentation.totalProjets),
                _MetricCard(
                  label: 'Objectifs',
                  value: presentation.totalObjectifs,
                ),
                _MetricCard(label: 'Terminés', value: done),
                _MetricCard(label: 'En cours', value: inProgress),
                _MetricCard(label: 'Bloqués', value: blocked),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final int value;

  const _MetricCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$value', style: theme.textTheme.displaySmall),
          const SizedBox(height: 8),
          Text(label, style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }
}

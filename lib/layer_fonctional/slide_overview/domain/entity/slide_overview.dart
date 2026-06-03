import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../slide_presentation/domain/entity/slide.dart';

class SlideOverview extends Slide {
  final int totalProjects;
  final int totalObjectifs;
  final int doneCount;
  final int failedCount;
  final int blockedCount;

  const SlideOverview({
    super.key,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required this.totalProjects,
    required this.totalObjectifs,
    required this.doneCount,
    required this.failedCount,
    required this.blockedCount,
  }) : super(
         configuration: const FlutterDeckSlideConfiguration(route: '/overview'),
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
            Text("Vue d'ensemble", style: theme.textTheme.displaySmall),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _MetricCard(label: 'Projects', value: totalProjects),
                _MetricCard(label: 'Objectifs', value: totalObjectifs),
                _MetricCard(label: 'Réussis', value: doneCount),
                _MetricCard(label: 'Échecs', value: failedCount),
                _MetricCard(label: 'Bloqués', value: blockedCount),
              ],
            ),
            const Spacer(),
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

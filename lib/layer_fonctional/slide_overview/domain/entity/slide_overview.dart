import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_shell.dart';

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
    required super.theme,
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
    return FlutterDeckSlide.blank(
      builder: (_) => SlideShell(
        theme: theme,
        pageNumber: pageNumber,
        totalPages: totalPages,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vue d'ensemble", style: theme.display()),
            const SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _MetricCard(
                  theme: theme,
                  label: 'Projects',
                  value: totalProjects,
                ),
                _MetricCard(
                  theme: theme,
                  label: 'Objectifs',
                  value: totalObjectifs,
                ),
                _MetricCard(theme: theme, label: 'Réussis', value: doneCount),
                _MetricCard(theme: theme, label: 'Échecs', value: failedCount),
                _MetricCard(
                  theme: theme,
                  label: 'Bloqués',
                  value: blockedCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final SlideTheme theme;
  final String label;
  final int value;

  const _MetricCard({
    required this.theme,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$value',
            style: theme.display(color: theme.colors.primaryColor),
          ),
          const SizedBox(height: 8),
          Text(label, style: theme.title()),
        ],
      ),
    );
  }
}

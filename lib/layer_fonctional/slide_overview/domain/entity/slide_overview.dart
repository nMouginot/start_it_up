import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../slide_presentation/domain/entity/slide_instance_id.dart';
import '../../../slide_presentation/domain/entity/slide_template.dart';
import '../../../slide_presentation/domain/entity/timeframe.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_shell.dart';

class SlideOverview extends Slide {
  final int totalProjects;
  final int totalObjectifs;
  final int doneCount;
  final int failedCount;
  final int blockedCount;

  factory SlideOverview({
    Key? key,
    String? instanceId,
    int pageNumber = 1,
    int totalPages = 1,
    required Timeframe timeframe,
    required SlideTheme theme,
    int totalProjects = 0,
    int totalObjectifs = 0,
    int doneCount = 0,
    int failedCount = 0,
    int blockedCount = 0,
  }) => SlideOverview._(
    key: key,
    instanceId: instanceId ?? newSlideInstanceId(),
    pageNumber: pageNumber,
    totalPages: totalPages,
    timeframe: timeframe,
    theme: theme,
    totalProjects: totalProjects,
    totalObjectifs: totalObjectifs,
    doneCount: doneCount,
    failedCount: failedCount,
    blockedCount: blockedCount,
  );

  SlideOverview._({
    super.key,
    required super.instanceId,
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
         configuration: FlutterDeckSlideConfiguration(
           route: '/overview-$instanceId',
         ),
       );

  static const String templateKeyValue = 'overview';

  static SlideTemplate template = SlideTemplate(
    key: templateKeyValue,
    label: "Vue d'ensemble",
    icon: Icons.dashboard,
    createDefault: ({required timeframe, required theme}) =>
        SlideOverview(timeframe: timeframe, theme: theme),
  );

  @override
  String get templateKey => templateKeyValue;

  @override
  String get summary =>
      '$totalProjects project(s) • $totalObjectifs objectif(s) • '
      '$doneCount réussis / $failedCount échecs / $blockedCount bloqués';

  @override
  SlideOverview copyWithCore({
    int? pageNumber,
    int? totalPages,
    Timeframe? timeframe,
    SlideTheme? theme,
  }) => SlideOverview._(
    instanceId: instanceId,
    pageNumber: pageNumber ?? this.pageNumber,
    totalPages: totalPages ?? this.totalPages,
    timeframe: timeframe ?? this.timeframe,
    theme: theme ?? this.theme,
    totalProjects: totalProjects,
    totalObjectifs: totalObjectifs,
    doneCount: doneCount,
    failedCount: failedCount,
    blockedCount: blockedCount,
  );

  SlideOverview copyWithMetrics({
    required int totalProjects,
    required int totalObjectifs,
    required int doneCount,
    required int failedCount,
    required int blockedCount,
  }) => SlideOverview._(
    instanceId: instanceId,
    pageNumber: pageNumber,
    totalPages: totalPages,
    timeframe: timeframe,
    theme: theme,
    totalProjects: totalProjects,
    totalObjectifs: totalObjectifs,
    doneCount: doneCount,
    failedCount: failedCount,
    blockedCount: blockedCount,
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
                _MetricCard(theme: theme, label: 'Projects', value: totalProjects),
                _MetricCard(theme: theme, label: 'Objectifs', value: totalObjectifs),
                _MetricCard(theme: theme, label: 'Réussis', value: doneCount),
                _MetricCard(theme: theme, label: 'Échecs', value: failedCount),
                _MetricCard(theme: theme, label: 'Bloqués', value: blockedCount),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSettings(BuildContext context, ValueChanged<Slide> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Métriques auto-calculées',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Cette slide agrège les slides projet présentes dans la présentation. '
            'Pas de réglage manuel.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(summary),
            ),
          ),
        ],
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

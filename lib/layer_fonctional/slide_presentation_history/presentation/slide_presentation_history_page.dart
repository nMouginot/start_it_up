import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../layer_technical/extension/date_time_extension.dart';
import '../../../layer_technical/navigation/data/app_routes.dart';
import '../../slide_presentation/domain/entity/project_slide_block.dart';
import '../../slide_presentation/domain/entity/slide_timeframe.dart';
import '../data/dto/slide_presentation_history_dto.dart';
import 'cubit/slide_presentation_history_cubit.dart';
import 'cubit/slide_presentation_history_state.dart';

class SlidePresentationHistoryPage extends StatelessWidget {
  const SlidePresentationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SlidePresentationHistoryCubit>()..load(),
      child: const _SlidePresentationHistoryView(),
    );
  }
}

class _SlidePresentationHistoryView extends StatelessWidget {
  const _SlidePresentationHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique des présentations')),
      body: SafeArea(
        child: BlocBuilder<
          SlidePresentationHistoryCubit,
          SlidePresentationHistoryState
        >(
          builder: (context, state) => switch (state) {
            SlidePresentationHistoryLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            SlidePresentationHistoryError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
            SlidePresentationHistoryLoaded(:final entries) => _EntryList(
              entries: entries,
            ),
          },
        ),
      ),
    );
  }
}

class _EntryList extends StatelessWidget {
  final List<SlidePresentationHistoryDto> entries;

  const _EntryList({required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Center(child: Text('Aucune présentation générée.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, index) => _EntryCard(entry: entries[index]),
    );
  }
}

class _EntryCard extends StatelessWidget {
  final SlidePresentationHistoryDto entry;

  const _EntryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final created = DateFormat('dd/MM/yyyy HH:mm').format(entry.createdAt);
    final intro = entry.presentation.slides
        .whereType<SlideTimeframe>()
        .firstOrNull;
    final blocks = entry.presentation.slides.whereType<ProjectSlideBlock>();
    final objectifsCount = blocks.fold(
      0,
      (sum, block) => sum + block.objectifs.length,
    );
    final title = intro == null
        ? 'Présentation'
        : 'Sprint du ${intro.start.formattedDayMonthYear} au ${intro.end.formattedDayMonthYear}';
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(
              '${blocks.length} project(s), $objectifsCount objectif(s) — généré le $created',
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text('Modifier'),
                  onPressed: () =>
                      context.push(AppRoutes.slideSetupEditPath(entry.id)),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Lancer'),
                  onPressed: () =>
                      context.push(AppRoutes.slideLaunchPath(entry.id)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

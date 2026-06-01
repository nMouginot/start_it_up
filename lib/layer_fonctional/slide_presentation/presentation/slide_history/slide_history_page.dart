import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../../layer_technical/navigation/data/app_routes.dart';
import '../../data/dto/slide_presentation_history_dto.dart';
import 'cubit/slide_history_cubit.dart';
import 'cubit/slide_history_state.dart';

class SlideHistoryPage extends StatelessWidget {
  const SlideHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SlideHistoryCubit>()..load(),
      child: const _SlideHistoryView(),
    );
  }
}

class _SlideHistoryView extends StatelessWidget {
  const _SlideHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique des présentations')),
      body: SafeArea(
        child: BlocBuilder<SlideHistoryCubit, SlideHistoryState>(
          builder: (context, state) => switch (state) {
            SlideHistoryLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            SlideHistoryError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
            SlideHistoryLoaded(:final entries) => _EntryList(entries: entries),
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
    final timeframe = entry.presentation.timeframe;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sprint du ${timeframe.start.formattedDayMonthYear} au ${timeframe.end.formattedDayMonthYear}',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '${entry.presentation.totalProjects} project(s), '
              '${entry.presentation.totalObjectifs} objectif(s) — généré le $created',
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
                      BlocProvider.of<SlideHistoryCubit>(context).launch(entry),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

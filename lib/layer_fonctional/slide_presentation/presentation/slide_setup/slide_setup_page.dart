import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../domain/entity/slide_timeframe.dart';
import 'cubit/slide_setup_cubit.dart';
import 'cubit/slide_setup_state.dart';
import 'widget/objectif_picker.dart';
import 'widget/slide_timeframe_picker.dart';

class SlideSetupPage extends StatelessWidget {
  final int? historyEntryId;

  const SlideSetupPage({super.key, this.historyEntryId});

  @override
  Widget build(BuildContext context) {
    final cubit = locator<SlideSetupCubit>()
      ..load(historyEntryId: historyEntryId);
    return BlocProvider<SlideSetupCubit>.value(
      value: cubit,
      child: const _SlideSetupView(),
    );
  }
}

class _SlideSetupView extends StatelessWidget {
  const _SlideSetupView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<SlideSetupCubit, SlideSetupState>(
          builder: (_, state) => const Text('Préparer la présentation'),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<SlideSetupCubit, SlideSetupState>(
          builder: (context, state) => _SetupForm(state: state),
        ),
      ),
    );
  }
}

class _SetupForm extends StatelessWidget {
  final SlideSetupState state;

  const _SetupForm({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SlideSetupCubit>(context);
    final catalog = state.catalog;

    if (state.catalogLoading || catalog == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(child: Text('Erreur : ${state.error}'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SlideTimeframePicker(
          timeframe: state.timeframe,
          onChanged: cubit.updateTimeframe,
        ),
        const SizedBox(height: 24),
        Text(
          'Objectifs du sprint',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ObjectifPicker(
          catalog: catalog,
          listSelectedObjectif: state.listSelectedObjectif,
          onToggle: cubit.toggleObjectif,
        ),
        const SizedBox(height: 24),
        _Summary(state: state),
        const SizedBox(height: 16),
        _ActionButtons(state: state, cubit: cubit),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final SlideSetupState state;
  final SlideSetupCubit cubit;

  const _ActionButtons({required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    final generateLabel = 'Générer la présentation';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton.icon(
          icon: state.building
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.build),
          label: Text(generateLabel),
          onPressed: state.canGenerate ? cubit.generate : null,
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          icon: const Icon(Icons.play_arrow),
          label: const Text('Lancer la présentation'),
          onPressed: state.canLaunch ? cubit.launch : null,
        ),
      ],
    );
  }
}

class _Summary extends StatelessWidget {
  final SlideSetupState state;

  const _Summary({required this.state});

  @override
  Widget build(BuildContext context) {
    final SlideTimeframe timeframe = state.timeframe;
    final built = state.builtPresentation;
    final summary =
        'Sprint du ${timeframe.start.formattedDayMonthYear} au '
        '${timeframe.end.formattedDayMonthYear} • '
        '${state.listSelectedObjectif.length} objectif(s) sur '
        '${state.selectedProjectCount} project(s)';
    final builtNote = built == null
        ? 'Aucune présentation prête.'
        : 'Présentation prête : ${built.totalProjects} project(s), '
              '${built.totalObjectifs} objectif(s).';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(summary, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(builtNote, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

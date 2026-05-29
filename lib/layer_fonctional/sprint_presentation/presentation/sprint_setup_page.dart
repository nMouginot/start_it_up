import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../layer_technical/extension/date_time_extension.dart';
import '../domain/entity/sprint_timeframe.dart';
import 'cubit/sprint_setup_cubit.dart';
import 'cubit/sprint_setup_state.dart';
import 'widget/projet_picker.dart';
import 'widget/sprint_timeframe_picker.dart';

class SprintSetupPage extends StatelessWidget {
  const SprintSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = locator<SprintSetupCubit>()..loadProjetsIfNeeded();
    return BlocProvider<SprintSetupCubit>.value(
      value: cubit,
      child: const _SprintSetupView(),
    );
  }
}

class _SprintSetupView extends StatelessWidget {
  const _SprintSetupView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Préparer la présentation')),
      body: SafeArea(
        child: BlocBuilder<SprintSetupCubit, SprintSetupState>(
          builder: (context, state) => _SetupForm(state: state),
        ),
      ),
    );
  }
}

class _SetupForm extends StatelessWidget {
  final SprintSetupState state;

  const _SetupForm({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SprintSetupCubit>(context);

    if (state.projetsLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(child: Text('Erreur : ${state.error}'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SprintTimeframePicker(
          timeframe: state.timeframe,
          onChanged: cubit.updateTimeframe,
        ),
        const SizedBox(height: 24),
        Text(
          'Projets du sprint',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ProjetPicker(
          projets: state.availableProjets,
          selectedIds: state.selectedProjetIds,
          onToggle: cubit.toggleProjet,
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
  final SprintSetupState state;
  final SprintSetupCubit cubit;

  const _ActionButtons({required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
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
          label: Text(
            state.builtPresentation == null
                ? 'Générer la présentation'
                : 'Régénérer',
          ),
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
  final SprintSetupState state;

  const _Summary({required this.state});

  @override
  Widget build(BuildContext context) {
    final SprintTimeframe timeframe = state.timeframe;
    final built = state.builtPresentation;
    final summary =
        'Sprint du ${timeframe.start.formattedDayMonthYear} au '
        '${timeframe.end.formattedDayMonthYear} • '
        '${state.selectedProjetIds.length} projet(s) sélectionné(s)';
    final builtNote = built == null
        ? 'Aucune présentation prête.'
        : 'Présentation prête : ${built.totalProjets} projet(s), '
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../layer_technical/extension/date_time_extension.dart';
import '../domain/entity/sprint_timeframe.dart';
import 'cubit/sprint_setup_cubit.dart';
import 'cubit/sprint_setup_state.dart';
import 'sprint_deck_page.dart';
import 'widget/projet_picker.dart';
import 'widget/sprint_timeframe_picker.dart';

class SprintSetupPage extends StatelessWidget {
  const SprintSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<SprintSetupCubit>()..loadProjets(),
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
        child: BlocConsumer<SprintSetupCubit, SprintSetupState>(
          listenWhen: (previous, current) =>
              previous.builtPresentation != current.builtPresentation &&
              current.builtPresentation != null,
          listener: _openDeck,
          builder: (context, state) => _SetupForm(state: state),
        ),
      ),
    );
  }

  Future<void> _openDeck(BuildContext context, SprintSetupState state) async {
    final presentation = state.builtPresentation;
    if (presentation == null) return;
    final cubit = BlocProvider.of<SprintSetupCubit>(context);

    cubit.consumeBuiltPresentation();
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        builder: (_) => SprintDeckPage(presentation: presentation),
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
        _GenerateButton(state: state, onPressed: cubit.generate),
        const SizedBox(height: 12),
        _Summary(state: state),
      ],
    );
  }
}

class _GenerateButton extends StatelessWidget {
  final SprintSetupState state;
  final Future<void> Function() onPressed;

  const _GenerateButton({required this.state, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: state.building
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.slideshow),
      label: const Text('Générer la présentation'),
      onPressed: state.canGenerate ? () => onPressed() : null,
    );
  }
}

class _Summary extends StatelessWidget {
  final SprintSetupState state;

  const _Summary({required this.state});

  @override
  Widget build(BuildContext context) {
    final SprintTimeframe timeframe = state.timeframe;
    return Text(
      'Sprint du ${timeframe.start.formattedDayMonthYear} au '
      '${timeframe.end.formattedDayMonthYear} • '
      '${state.selectedProjetIds.length} projet(s) sélectionné(s)',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

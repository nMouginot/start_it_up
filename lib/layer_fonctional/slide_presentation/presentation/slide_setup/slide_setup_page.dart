import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_theme_picker.dart';
import 'cubit/slide_setup_cubit.dart';
import 'cubit/slide_setup_state.dart';
import 'widget/slide_list_editor.dart';
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
      appBar: AppBar(title: const Text('Préparer la présentation')),
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

    if (state.loading) {
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
        SlideThemePicker(
          theme: state.theme,
          currentJson: state.exportJson,
          onImport: cubit.importThemeFromJson,
          onReset: () => cubit.updateTheme(const SlideTheme.defaults()),
        ),
        const SizedBox(height: 24),
        Text('Slides', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        SlideListEditor(
          cubit: cubit,
          slides: state.slides,
          templates: state.templates,
        ),
        const SizedBox(height: 24),
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
          label: const Text('Générer la présentation'),
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

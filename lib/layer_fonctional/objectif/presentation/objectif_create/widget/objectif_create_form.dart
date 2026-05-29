import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../layer_technical/extension/date_time_extension.dart';
import '../../../../projet/domain/entity/projet.dart';
import '../cubit/objectif_create_cubit.dart';
import '../cubit/objectif_create_state.dart';

class ObjectifCreateForm extends StatelessWidget {
  final ObjectifCreateState state;
  final bool projetLocked;

  const ObjectifCreateForm({
    super.key,
    required this.state,
    required this.projetLocked,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ObjectifCreateCubit>(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ProjetField(
          state: state,
          projetLocked: projetLocked,
          onChanged: cubit.updateProjet,
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: state.title,
          decoration: const InputDecoration(
            labelText: 'Titre',
            border: OutlineInputBorder(),
          ),
          onChanged: cubit.updateTitle,
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: state.description,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
          onChanged: cubit.updateDescription,
        ),
        const SizedBox(height: 16),
        _DeadlineField(
          deadline: state.deadline,
          onChanged: cubit.updateDeadline,
        ),
        const SizedBox(height: 24),
        if (state.error != null) ...[
          Text(
            'Erreur : ${state.error}',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 12),
        ],
        FilledButton.icon(
          icon: state.submitting
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.add),
          label: const Text("Créer l'objectif"),
          onPressed: state.canSubmit ? cubit.submit : null,
        ),
      ],
    );
  }
}

class _ProjetField extends StatelessWidget {
  final ObjectifCreateState state;
  final bool projetLocked;
  final ValueChanged<int> onChanged;

  const _ProjetField({
    required this.state,
    required this.projetLocked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (projetLocked) {
      final projet = state.availableProjets.firstWhere(
        (p) => p.id == state.selectedProjetId,
        orElse: () =>
            Projet(id: state.selectedProjetId ?? 0, name: '…', version: ''),
      );
      return InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Projet',
          border: OutlineInputBorder(),
        ),
        child: Text(projet.name),
      );
    }
    return DropdownButtonFormField<int>(
      initialValue: state.selectedProjetId,
      decoration: const InputDecoration(
        labelText: 'Projet',
        border: OutlineInputBorder(),
      ),
      items: state.availableProjets
          .map(
            (projet) =>
                DropdownMenuItem(value: projet.id, child: Text(projet.name)),
          )
          .toList(growable: false),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }
}

class _DeadlineField extends StatelessWidget {
  final DateTime deadline;
  final ValueChanged<DateTime> onChanged;

  const _DeadlineField({required this.deadline, required this.onChanged});

  Future<void> _pick(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: deadline,
      firstDate: DateTime(deadline.year - 1),
      lastDate: DateTime(deadline.year + 2),
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pick(context),
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Échéance',
          border: OutlineInputBorder(),
        ),
        child: Text(deadline.formattedDayMonthYear),
      ),
    );
  }
}

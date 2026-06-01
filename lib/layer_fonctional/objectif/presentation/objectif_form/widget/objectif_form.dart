import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../layer_technical/extension/date_time_extension.dart';
import '../cubit/objectif_form_cubit.dart';
import '../cubit/objectif_form_state.dart';

class ObjectifForm extends StatelessWidget {
  final ObjectifFormState state;
  final bool projectLocked;

  const ObjectifForm({
    super.key,
    required this.state,
    required this.projectLocked,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ObjectifFormCubit>(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ProjectField(
          state: state,
          projectLocked: projectLocked,
          onChanged: cubit.updateProject,
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
              : Icon(state.isEditing ? Icons.save : Icons.add),
          label: Text(state.isEditing ? 'Enregistrer' : "Créer l'objectif"),
          onPressed: state.canSubmit ? cubit.submit : null,
        ),
      ],
    );
  }
}

class _ProjectField extends StatelessWidget {
  final ObjectifFormState state;
  final bool projectLocked;
  final ValueChanged<int> onChanged;

  const _ProjectField({
    required this.state,
    required this.projectLocked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (projectLocked) {
      final selectedId = state.selectedProjectId;
      final name = selectedId == null
          ? '—'
          : state.availableProjects
                    .where((p) => p.id == selectedId)
                    .map((p) => p.name)
                    .firstOrNull ??
                '…';
      return InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Project',
          border: OutlineInputBorder(),
        ),
        child: Text(name),
      );
    }
    return DropdownButtonFormField<int>(
      initialValue: state.selectedProjectId,
      decoration: const InputDecoration(
        labelText: 'Project',
        border: OutlineInputBorder(),
      ),
      items: state.availableProjects
          .map(
            (project) =>
                DropdownMenuItem(value: project.id, child: Text(project.name)),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/project_form_cubit.dart';
import '../cubit/project_form_state.dart';

class ProjectForm extends StatelessWidget {
  final ProjectFormState state;

  const ProjectForm({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProjectFormCubit>(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          initialValue: state.name,
          decoration: const InputDecoration(
            labelText: 'Nom',
            border: OutlineInputBorder(),
          ),
          onChanged: cubit.updateName,
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: state.version,
          decoration: const InputDecoration(
            labelText: 'Version',
            border: OutlineInputBorder(),
            hintText: '0.1.0',
          ),
          onChanged: cubit.updateVersion,
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
          label: Text(state.isEditing ? 'Enregistrer' : 'Créer le project'),
          onPressed: state.canSubmit ? cubit.submit : null,
        ),
      ],
    );
  }
}

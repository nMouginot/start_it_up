import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../domain/entity/project.dart';
import 'cubit/project_form_cubit.dart';
import 'cubit/project_form_state.dart';
import 'widget/project_form.dart';

class ProjectFormPage extends StatelessWidget {
  final Project? existing;

  const ProjectFormPage({super.key, this.existing});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProjectFormCubit>(param1: existing),
      child: _ProjectFormView(isEditing: existing != null),
    );
  }
}

class _ProjectFormView extends StatelessWidget {
  final bool isEditing;

  const _ProjectFormView({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Modifier le project' : 'Nouveau project'),
      ),
      body: SafeArea(
        child: BlocConsumer<ProjectFormCubit, ProjectFormState>(
          listenWhen: (previous, current) =>
              !previous.submitted && current.submitted,
          listener: (context, _) => Navigator.of(context).pop(true),
          builder: (context, state) => ProjectForm(state: state),
        ),
      ),
    );
  }
}

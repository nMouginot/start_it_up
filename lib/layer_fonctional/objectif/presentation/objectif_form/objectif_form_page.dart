import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../domain/entity/objectif.dart';
import 'cubit/objectif_form_cubit.dart';
import 'cubit/objectif_form_state.dart';
import 'widget/objectif_form.dart';

/// Create / edit form for an objectif. Routed to from:
///   - home: no [initialProjectId], no [existing] (free pick of project)
///   - project detail (new): [initialProjectId] set, [existing] null (project locked)
///   - project detail (edit): [existing] set (project locked, fields pre-filled)
class ObjectifFormPage extends StatelessWidget {
  final int? initialProjectId;
  final Objectif? existing;

  const ObjectifFormPage({super.key, this.initialProjectId, this.existing});

  @override
  Widget build(BuildContext context) {
    final projectLocked = existing != null || initialProjectId != null;
    return BlocProvider(
      create: (_) =>
          locator<ObjectifFormCubit>(param1: initialProjectId, param2: existing)
            ..loadProjects(),
      child: _ObjectifFormView(
        projectLocked: projectLocked,
        isEditing: existing != null,
      ),
    );
  }
}

class _ObjectifFormView extends StatelessWidget {
  final bool projectLocked;
  final bool isEditing;

  const _ObjectifFormView({
    required this.projectLocked,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Modifier l'objectif" : 'Nouvel objectif'),
      ),
      body: SafeArea(
        child: BlocConsumer<ObjectifFormCubit, ObjectifFormState>(
          listenWhen: (previous, current) =>
              !previous.submitted && current.submitted,
          listener: (context, _) => Navigator.of(context).pop(true),
          builder: (context, state) {
            if (state.projectsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ObjectifForm(state: state, projectLocked: projectLocked);
          },
        ),
      ),
    );
  }
}

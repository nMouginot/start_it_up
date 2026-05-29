import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../domain/entity/objectif.dart';
import 'cubit/objectif_form_cubit.dart';
import 'cubit/objectif_form_state.dart';
import 'widget/objectif_form.dart';

/// Create / edit form for an objectif. Routed to from:
///   - home: no [initialProjetId], no [existing] (free pick of projet)
///   - projet detail (new): [initialProjetId] set, [existing] null (projet locked)
///   - projet detail (edit): [existing] set (projet locked, fields pre-filled)
class ObjectifFormPage extends StatelessWidget {
  final int? initialProjetId;
  final Objectif? existing;

  const ObjectifFormPage({super.key, this.initialProjetId, this.existing});

  @override
  Widget build(BuildContext context) {
    final projetLocked = existing != null || initialProjetId != null;
    return BlocProvider(
      create: (_) =>
          locator<ObjectifFormCubit>(param1: initialProjetId, param2: existing)
            ..loadProjets(),
      child: _ObjectifFormView(
        projetLocked: projetLocked,
        isEditing: existing != null,
      ),
    );
  }
}

class _ObjectifFormView extends StatelessWidget {
  final bool projetLocked;
  final bool isEditing;

  const _ObjectifFormView({
    required this.projetLocked,
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
            if (state.projetsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ObjectifForm(state: state, projetLocked: projetLocked);
          },
        ),
      ),
    );
  }
}

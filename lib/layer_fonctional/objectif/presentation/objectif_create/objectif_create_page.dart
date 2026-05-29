import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import 'cubit/objectif_create_cubit.dart';
import 'cubit/objectif_create_state.dart';
import 'widget/objectif_create_form.dart';

class ObjectifCreatePage extends StatelessWidget {
  final int? initialProjetId;

  const ObjectifCreatePage({super.key, this.initialProjetId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          locator<ObjectifCreateCubit>(param1: initialProjetId)..loadProjets(),
      child: _ObjectifCreateView(projetLocked: initialProjetId != null),
    );
  }
}

class _ObjectifCreateView extends StatelessWidget {
  final bool projetLocked;

  const _ObjectifCreateView({required this.projetLocked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvel objectif')),
      body: SafeArea(
        child: BlocConsumer<ObjectifCreateCubit, ObjectifCreateState>(
          listenWhen: (previous, current) =>
              !previous.submitted && current.submitted,
          listener: (context, _) => Navigator.of(context).pop(true),
          builder: (context, state) {
            if (state.projetsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ObjectifCreateForm(state: state, projetLocked: projetLocked);
          },
        ),
      ),
    );
  }
}

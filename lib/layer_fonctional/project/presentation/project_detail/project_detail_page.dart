import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/navigation/data/app_routes.dart';
import '../../../objectif/domain/entity/objectif.dart';
import '../../../objectif/presentation/widget/objectif_list_tile.dart';
import '../../domain/entity/project.dart';
import 'cubit/project_detail_cubit.dart';
import 'cubit/project_detail_state.dart';

class ProjectDetailPage extends StatelessWidget {
  final int projectId;

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProjectDetailCubit>()..load(projectId),
      child: _ProjectDetailView(projectId: projectId),
    );
  }
}

class _ProjectDetailView extends StatelessWidget {
  final int projectId;

  const _ProjectDetailView({required this.projectId});

  Future<void> _createObjectif(BuildContext context) async {
    final cubit = BlocProvider.of<ProjectDetailCubit>(context);
    await context.push<bool>(AppRoutes.projectObjectifCreatePath(projectId));
    await cubit.load(projectId);
  }

  Future<void> _editObjectif(BuildContext context, Objectif objectif) async {
    final cubit = BlocProvider.of<ProjectDetailCubit>(context);
    await context.push<bool>(
      AppRoutes.objectifEditPath(objectif.id),
      extra: objectif,
    );
    await cubit.load(projectId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createObjectif(context),
        icon: const Icon(Icons.add),
        label: const Text('Objectif'),
      ),
      body: SafeArea(
        child: BlocBuilder<ProjectDetailCubit, ProjectDetailState>(
          builder: (context, state) => switch (state) {
            ProjectDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProjectDetailError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
            ProjectDetailLoaded(:final project, :final objectifs) =>
              _LoadedView(
                project: project,
                objectifs: objectifs,
                onEditObjectif: (objectif) => _editObjectif(context, objectif),
              ),
          },
        ),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final Project project;
  final List<Objectif> objectifs;
  final ValueChanged<Objectif> onEditObjectif;

  const _LoadedView({
    required this.project,
    required this.objectifs,
    required this.onEditObjectif,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProjectHeader(project: project, objectifCount: objectifs.length),
        const Divider(height: 1),
        Expanded(
          child: _ObjectifList(objectifs: objectifs, onEdit: onEditObjectif),
        ),
      ],
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  final Project project;
  final int objectifCount;

  const _ProjectHeader({required this.project, required this.objectifCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.name, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('Version ${project.version}', style: theme.textTheme.titleSmall),
          const SizedBox(height: 12),
          Text('$objectifCount objectif(s)', style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ObjectifList extends StatelessWidget {
  final List<Objectif> objectifs;
  final ValueChanged<Objectif> onEdit;

  const _ObjectifList({required this.objectifs, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    if (objectifs.isEmpty) {
      return const Center(child: Text('Aucun objectif pour ce project.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: objectifs.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final objectif = objectifs[index];
        return ObjectifListTile(
          objectif: objectif,
          onEdit: () => onEdit(objectif),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/navigation/data/app_routes.dart';
import '../../domain/entity/project.dart';
import 'cubit/project_list_cubit.dart';
import 'cubit/project_list_state.dart';

class ProjectListPage extends StatelessWidget {
  const ProjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProjectListCubit>()..load(),
      child: const _ProjectListView(),
    );
  }
}

class _ProjectListView extends StatelessWidget {
  const _ProjectListView();

  Future<void> _createProject(BuildContext context) async {
    final cubit = BlocProvider.of<ProjectListCubit>(context);
    await context.push<bool>(AppRoutes.projectCreate);
    await cubit.load();
  }

  Future<void> _editProject(BuildContext context, Project project) async {
    final cubit = BlocProvider.of<ProjectListCubit>(context);
    await context.push<bool>(
      AppRoutes.projectEditPath(project.id),
      extra: project,
    );
    await cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createProject(context),
        icon: const Icon(Icons.add),
        label: const Text('Project'),
      ),
      body: SafeArea(
        child: BlocBuilder<ProjectListCubit, ProjectListState>(
          builder: (context, state) => switch (state) {
            ProjectListLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProjectListError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
            ProjectListLoaded(:final projects) => _ProjectList(
              projects: projects,
              onEdit: (project) => _editProject(context, project),
            ),
          },
        ),
      ),
    );
  }
}

class _ProjectList extends StatelessWidget {
  final List<Project> projects;
  final ValueChanged<Project> onEdit;

  const _ProjectList({required this.projects, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const Center(child: Text('Aucun project.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: projects.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, index) => _ProjectCard(
        project: projects[index],
        onEdit: () => onEdit(projects[index]),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onEdit;

  const _ProjectCard({required this.project, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: CircleAvatar(child: Text('${project.id}')),
        title: Text(project.name),
        subtitle: Text('v${project.version}'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          tooltip: 'Modifier',
          onPressed: onEdit,
        ),
        onTap: () => context.go(AppRoutes.projectDetailPath(project.id)),
      ),
    );
  }
}

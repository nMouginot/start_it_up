import '../../../domain/entity/project.dart';

sealed class ProjectListState {
  const ProjectListState();
}

class ProjectListLoading extends ProjectListState {
  const ProjectListLoading();
}

class ProjectListLoaded extends ProjectListState {
  final List<Project> projects;

  const ProjectListLoaded(this.projects);
}

class ProjectListError extends ProjectListState {
  final Object error;

  const ProjectListError(this.error);
}

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../domain/entity/project.dart';

sealed class ProjectDetailState {
  const ProjectDetailState();
}

class ProjectDetailLoading extends ProjectDetailState {
  const ProjectDetailLoading();
}

class ProjectDetailLoaded extends ProjectDetailState {
  final Project project;
  final List<Objectif> objectifs;

  const ProjectDetailLoaded({required this.project, required this.objectifs});
}

class ProjectDetailError extends ProjectDetailState {
  final Object error;

  const ProjectDetailError(this.error);
}

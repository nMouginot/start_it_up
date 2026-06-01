import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_project_by_id_use_case.dart';
import 'project_detail_state.dart';

class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  final GetProjectByIdUseCase _getProjectByIdUseCase;

  ProjectDetailCubit({required GetProjectByIdUseCase getProjectByIdUseCase})
    : _getProjectByIdUseCase = getProjectByIdUseCase,
      super(const ProjectDetailLoading());

  Future<void> load(int projectId) async {
    emit(const ProjectDetailLoading());
    try {
      final project = await _getProjectByIdUseCase.execute(projectId);
      emit(
        ProjectDetailLoaded(
          project: project,
          objectifs: project.listObjectif,
        ),
      );
    } catch (error) {
      emit(ProjectDetailError(error));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../objectif/domain/use_case/get_objectifs_by_project_use_case.dart';
import '../../../domain/use_case/get_project_by_id_use_case.dart';
import 'project_detail_state.dart';

class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  final GetProjectByIdUseCase _getProjectByIdUseCase;
  final GetObjectifsByProjectUseCase _getObjectifsByProjectUseCase;

  ProjectDetailCubit({
    required GetProjectByIdUseCase getProjectByIdUseCase,
    required GetObjectifsByProjectUseCase getObjectifsByProjectUseCase,
  }) : _getProjectByIdUseCase = getProjectByIdUseCase,
       _getObjectifsByProjectUseCase = getObjectifsByProjectUseCase,
       super(const ProjectDetailLoading());

  Future<void> load(int projectId) async {
    emit(const ProjectDetailLoading());
    try {
      final projectFuture = _getProjectByIdUseCase.execute(projectId);
      final objectifsFuture = _getObjectifsByProjectUseCase.execute(projectId);
      final project = await projectFuture;
      final objectifs = await objectifsFuture;
      emit(ProjectDetailLoaded(project: project, objectifs: objectifs));
    } catch (error) {
      emit(ProjectDetailError(error));
    }
  }
}

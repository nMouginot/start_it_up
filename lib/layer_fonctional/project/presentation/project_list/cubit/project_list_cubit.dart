import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_projects_use_case.dart';
import 'project_list_state.dart';

class ProjectListCubit extends Cubit<ProjectListState> {
  final GetProjectsUseCase _getProjectsUseCase;

  ProjectListCubit({required GetProjectsUseCase getProjectsUseCase})
    : _getProjectsUseCase = getProjectsUseCase,
      super(const ProjectListLoading());

  Future<void> load() async {
    emit(const ProjectListLoading());
    try {
      final projects = await _getProjectsUseCase.execute();
      emit(ProjectListLoaded(projects));
    } catch (error) {
      emit(ProjectListError(error));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../project/domain/use_case/get_projects_use_case.dart';
import '../../../domain/entity/objectif.dart';
import '../../../domain/use_case/upsert_objectif_use_case.dart';
import 'objectif_form_state.dart';

class ObjectifFormCubit extends Cubit<ObjectifFormState> {
  final GetProjectsUseCase _getProjectsUseCase;
  final UpsertObjectifUseCase _upsertObjectifUseCase;

  ObjectifFormCubit({
    required GetProjectsUseCase getProjectsUseCase,
    required UpsertObjectifUseCase upsertObjectifUseCase,
    int? initialProjectId,
    Objectif? existing,
  }) : _getProjectsUseCase = getProjectsUseCase,
       _upsertObjectifUseCase = upsertObjectifUseCase,
       super(
         ObjectifFormState.initial(
           initialProjectId: initialProjectId,
           existing: existing,
         ),
       );

  Future<void> loadProjects() async {
    emit(state.copyWith(projectsLoading: true, error: null));
    try {
      final projects = await _getProjectsUseCase.execute();
      emit(state.copyWith(projectsLoading: false, availableProjects: projects));
    } catch (error) {
      emit(state.copyWith(projectsLoading: false, error: error));
    }
  }

  void updateTitle(String value) => emit(state.copyWith(title: value));

  void updateDescription(String value) =>
      emit(state.copyWith(description: value));

  void updateDeadline(DateTime value) => emit(state.copyWith(deadline: value));

  void updateProject(int projectId) =>
      emit(state.copyWith(selectedProjectId: projectId));

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitting: true, error: null));
    try {
      await _upsertObjectifUseCase.execute(
        existing: state.existing,
        projectId: state.selectedProjectId,
        title: state.title.trim(),
        description: state.description.trim(),
        deadline: state.deadline,
      );
      emit(state.copyWith(submitting: false, submitted: true));
    } catch (error) {
      emit(state.copyWith(submitting: false, error: error));
    }
  }
}

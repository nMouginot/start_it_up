import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../project/domain/use_case/get_projects_use_case.dart';
import '../../../domain/entity/objectif.dart';
import '../../../domain/use_case/create_objectif_use_case.dart';
import '../../../domain/use_case/update_objectif_use_case.dart';
import 'objectif_form_state.dart';

class ObjectifFormCubit extends Cubit<ObjectifFormState> {
  final GetProjectsUseCase _getProjectsUseCase;
  final CreateObjectifUseCase _createObjectifUseCase;
  final UpdateObjectifUseCase _updateObjectifUseCase;

  ObjectifFormCubit({
    required GetProjectsUseCase getProjectsUseCase,
    required CreateObjectifUseCase createObjectifUseCase,
    required UpdateObjectifUseCase updateObjectifUseCase,
    int? initialProjectId,
    Objectif? existing,
  }) : _getProjectsUseCase = getProjectsUseCase,
       _createObjectifUseCase = createObjectifUseCase,
       _updateObjectifUseCase = updateObjectifUseCase,
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
      final existing = state.existing;
      if (existing != null) {
        await _updateObjectifUseCase.execute(
          existing.copyWith(
            title: state.title.trim(),
            description: state.description.trim(),
            deadline: state.deadline,
          ),
        );
      } else {
        await _createObjectifUseCase.execute(
          projectId: state.selectedProjectId!,
          title: state.title.trim(),
          description: state.description.trim(),
          deadline: state.deadline,
        );
      }
      emit(state.copyWith(submitting: false, submitted: true));
    } catch (error) {
      emit(state.copyWith(submitting: false, error: error));
    }
  }
}

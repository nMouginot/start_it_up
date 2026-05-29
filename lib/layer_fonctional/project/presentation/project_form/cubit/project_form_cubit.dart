import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/project.dart';
import '../../../domain/use_case/create_project_use_case.dart';
import '../../../domain/use_case/update_project_use_case.dart';
import 'project_form_state.dart';

class ProjectFormCubit extends Cubit<ProjectFormState> {
  final CreateProjectUseCase _createProjectUseCase;
  final UpdateProjectUseCase _updateProjectUseCase;

  ProjectFormCubit({
    required CreateProjectUseCase createProjectUseCase,
    required UpdateProjectUseCase updateProjectUseCase,
    Project? existing,
  }) : _createProjectUseCase = createProjectUseCase,
       _updateProjectUseCase = updateProjectUseCase,
       super(ProjectFormState.initial(existing: existing));

  void updateName(String value) => emit(state.copyWith(name: value));

  void updateVersion(String value) => emit(state.copyWith(version: value));

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitting: true, error: null));
    try {
      final existing = state.existing;
      if (existing != null) {
        await _updateProjectUseCase.execute(
          existing.copyWith(
            name: state.name.trim(),
            version: state.version.trim(),
          ),
        );
      } else {
        await _createProjectUseCase.execute(
          name: state.name.trim(),
          version: state.version.trim(),
        );
      }
      emit(state.copyWith(submitting: false, submitted: true));
    } catch (error) {
      emit(state.copyWith(submitting: false, error: error));
    }
  }
}

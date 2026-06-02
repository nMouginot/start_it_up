import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/project.dart';
import '../../../domain/use_case/upsert_project_use_case.dart';
import 'project_form_state.dart';

class ProjectFormCubit extends Cubit<ProjectFormState> {
  final UpsertProjectUseCase _upsertProjectUseCase;

  ProjectFormCubit({
    required UpsertProjectUseCase upsertProjectUseCase,
    Project? existing,
  }) : _upsertProjectUseCase = upsertProjectUseCase,
       super(ProjectFormState.initial(existing: existing));

  void updateName(String value) => emit(state.copyWith(name: value));

  void updateVersion(String value) => emit(state.copyWith(version: value));

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitting: true, error: null));
    try {
      await _upsertProjectUseCase.execute(
        existing: state.existing,
        name: state.name.trim(),
        version: state.version.trim(),
      );
      emit(state.copyWith(submitting: false, submitted: true));
    } catch (error) {
      emit(state.copyWith(submitting: false, error: error));
    }
  }
}

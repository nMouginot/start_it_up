import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../projet/domain/use_case/get_projets_use_case.dart';
import '../../../domain/use_case/create_objectif_use_case.dart';
import 'objectif_create_state.dart';

class ObjectifCreateCubit extends Cubit<ObjectifCreateState> {
  final GetProjetsUseCase _getProjetsUseCase;
  final CreateObjectifUseCase _createObjectifUseCase;

  ObjectifCreateCubit({
    required GetProjetsUseCase getProjetsUseCase,
    required CreateObjectifUseCase createObjectifUseCase,
    int? initialProjetId,
  }) : _getProjetsUseCase = getProjetsUseCase,
       _createObjectifUseCase = createObjectifUseCase,
       super(ObjectifCreateState.initial(initialProjetId: initialProjetId));

  Future<void> loadProjets() async {
    emit(state.copyWith(projetsLoading: true, clearError: true));
    try {
      final projets = await _getProjetsUseCase.execute();
      emit(state.copyWith(projetsLoading: false, availableProjets: projets));
    } catch (error) {
      emit(state.copyWith(projetsLoading: false, error: error));
    }
  }

  void updateTitle(String value) => emit(state.copyWith(title: value));

  void updateDescription(String value) =>
      emit(state.copyWith(description: value));

  void updateDeadline(DateTime value) => emit(state.copyWith(deadline: value));

  void updateProjet(int projetId) =>
      emit(state.copyWith(selectedProjetId: projetId));

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitting: true, clearError: true));
    try {
      await _createObjectifUseCase.execute(
        projetId: state.selectedProjetId!,
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

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../projet/domain/use_case/get_projets_use_case.dart';
import '../../../domain/entity/objectif.dart';
import '../../../domain/use_case/create_objectif_use_case.dart';
import '../../../domain/use_case/update_objectif_use_case.dart';
import 'objectif_form_state.dart';

class ObjectifFormCubit extends Cubit<ObjectifFormState> {
  final GetProjetsUseCase _getProjetsUseCase;
  final CreateObjectifUseCase _createObjectifUseCase;
  final UpdateObjectifUseCase _updateObjectifUseCase;

  ObjectifFormCubit({
    required GetProjetsUseCase getProjetsUseCase,
    required CreateObjectifUseCase createObjectifUseCase,
    required UpdateObjectifUseCase updateObjectifUseCase,
    int? initialProjetId,
    Objectif? existing,
  }) : _getProjetsUseCase = getProjetsUseCase,
       _createObjectifUseCase = createObjectifUseCase,
       _updateObjectifUseCase = updateObjectifUseCase,
       super(
         ObjectifFormState.initial(
           initialProjetId: initialProjetId,
           existing: existing,
         ),
       );

  Future<void> loadProjets() async {
    emit(state.copyWith(projetsLoading: true, error: null));
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
          projetId: state.selectedProjetId!,
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

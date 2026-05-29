import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../projet/domain/entity/projet.dart';
import '../../../projet/domain/use_case/get_projets_use_case.dart';
import '../../domain/entity/sprint_timeframe.dart';
import '../../domain/use_case/build_sprint_presentation_use_case.dart';
import 'sprint_setup_state.dart';

class SprintSetupCubit extends Cubit<SprintSetupState> {
  final GetProjetsUseCase _getProjetsUseCase;
  final BuildSprintPresentationUseCase _buildSprintPresentationUseCase;

  SprintSetupCubit({
    required GetProjetsUseCase getProjetsUseCase,
    required BuildSprintPresentationUseCase buildSprintPresentationUseCase,
  }) : _getProjetsUseCase = getProjetsUseCase,
       _buildSprintPresentationUseCase = buildSprintPresentationUseCase,
       super(SprintSetupState.initial());

  Future<void> loadProjets() async {
    emit(state.copyWith(projetsLoading: true, clearError: true));
    try {
      final projets = await _getProjetsUseCase.execute();
      emit(state.copyWith(projetsLoading: false, availableProjets: projets));
    } catch (error) {
      emit(state.copyWith(projetsLoading: false, error: error));
    }
  }

  void toggleProjet(Projet projet) {
    final next = Set<int>.from(state.selectedProjetIds);
    if (!next.add(projet.id)) next.remove(projet.id);
    emit(state.copyWith(selectedProjetIds: next));
  }

  void updateTimeframe(SprintTimeframe timeframe) {
    emit(state.copyWith(timeframe: timeframe));
  }

  Future<void> generate() async {
    if (!state.canGenerate) return;
    emit(
      state.copyWith(
        building: true,
        clearError: true,
        clearBuiltPresentation: true,
      ),
    );
    try {
      final selected = state.availableProjets
          .where((projet) => state.selectedProjetIds.contains(projet.id))
          .toList(growable: false);
      final presentation = await _buildSprintPresentationUseCase.execute(
        timeframe: state.timeframe,
        selectedProjets: selected,
      );
      emit(state.copyWith(building: false, builtPresentation: presentation));
    } catch (error) {
      emit(state.copyWith(building: false, error: error));
    }
  }

  void consumeBuiltPresentation() {
    emit(state.copyWith(clearBuiltPresentation: true));
  }
}

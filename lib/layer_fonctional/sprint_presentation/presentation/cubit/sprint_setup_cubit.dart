import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../projet/domain/entity/projet.dart';
import '../../../projet/domain/use_case/get_projets_use_case.dart';
import '../../domain/entity/sprint_timeframe.dart';
import '../../domain/use_case/build_sprint_presentation_use_case.dart';
import '../presentation_launcher.dart';
import 'sprint_setup_state.dart';

class SprintSetupCubit extends Cubit<SprintSetupState> {
  final GetProjetsUseCase _getProjetsUseCase;
  final BuildSprintPresentationUseCase _buildSprintPresentationUseCase;
  final PresentationLauncher _presentationLauncher;

  SprintSetupCubit({
    required GetProjetsUseCase getProjetsUseCase,
    required BuildSprintPresentationUseCase buildSprintPresentationUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _getProjetsUseCase = getProjetsUseCase,
       _buildSprintPresentationUseCase = buildSprintPresentationUseCase,
       _presentationLauncher = presentationLauncher,
       super(SprintSetupState.initial());

  Future<void> loadProjetsIfNeeded() async {
    if (state.availableProjets.isNotEmpty || !state.projetsLoading) return;
    await _loadProjets();
  }

  Future<void> _loadProjets() async {
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
    emit(state.copyWith(selectedProjetIds: next, clearBuiltPresentation: true));
  }

  void updateTimeframe(SprintTimeframe timeframe) {
    emit(state.copyWith(timeframe: timeframe, clearBuiltPresentation: true));
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

  void launch() {
    final presentation = state.builtPresentation;
    if (presentation == null) return;
    _presentationLauncher.launch(presentation);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../../projet_catalog/domain/use_case/get_projet_catalog_use_case.dart';
import '../../../domain/entity/sprint_timeframe.dart';
import '../../../domain/use_case/build_sprint_presentation_use_case.dart';
import '../../presentation_launcher.dart';
import 'sprint_setup_state.dart';

class SprintSetupCubit extends Cubit<SprintSetupState> {
  final GetProjetCatalogUseCase _getProjetCatalogUseCase;
  final BuildSprintPresentationUseCase _buildSprintPresentationUseCase;
  final PresentationLauncher _presentationLauncher;

  SprintSetupCubit({
    required GetProjetCatalogUseCase getProjetCatalogUseCase,
    required BuildSprintPresentationUseCase buildSprintPresentationUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _getProjetCatalogUseCase = getProjetCatalogUseCase,
       _buildSprintPresentationUseCase = buildSprintPresentationUseCase,
       _presentationLauncher = presentationLauncher,
       super(SprintSetupState.initial());

  Future<void> loadCatalogIfNeeded() async {
    if (state.catalog != null || !state.catalogLoading) return;
    await _loadCatalog();
  }

  Future<void> _loadCatalog() async {
    emit(state.copyWith(catalogLoading: true, error: null));
    try {
      final catalog = await _getProjetCatalogUseCase.execute();
      emit(state.copyWith(catalogLoading: false, catalog: catalog));
    } catch (error) {
      emit(state.copyWith(catalogLoading: false, error: error));
    }
  }

  void toggleObjectif(Objectif objectif) {
    final next = Set<int>.from(state.selectedObjectifIds);
    if (!next.add(objectif.id)) next.remove(objectif.id);
    emit(state.copyWith(selectedObjectifIds: next, builtPresentation: null));
  }

  void updateTimeframe(SprintTimeframe timeframe) {
    emit(state.copyWith(timeframe: timeframe, builtPresentation: null));
  }

  Future<void> generate() async {
    final catalog = state.catalog;
    if (!state.canGenerate || catalog == null) return;
    emit(state.copyWith(building: true, error: null, builtPresentation: null));
    try {
      final presentation = await _buildSprintPresentationUseCase.execute(
        timeframe: state.timeframe,
        catalog: catalog,
        selectedObjectifIds: state.selectedObjectifIds,
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

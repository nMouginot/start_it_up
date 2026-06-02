import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../domain/entity/slide_timeframe.dart';
import '../../../domain/use_case/generate_slide_presentation_use_case.dart';
import '../../../domain/use_case/load_slide_setup_use_case.dart';
import '../../../domain/use_case/toggle_objectif_selection_use_case.dart';
import '../../presentation_launcher.dart';
import 'slide_setup_state.dart';

class SlideSetupCubit extends Cubit<SlideSetupState> {
  final LoadSlideSetupUseCase _loadSlideSetupUseCase;
  final ToggleObjectifSelectionUseCase _toggleObjectifSelectionUseCase;
  final GenerateSlidePresentationUseCase _generateSlidePresentationUseCase;
  final PresentationLauncher _presentationLauncher;

  SlideSetupCubit({
    required LoadSlideSetupUseCase loadSlideSetupUseCase,
    required ToggleObjectifSelectionUseCase toggleObjectifSelectionUseCase,
    required GenerateSlidePresentationUseCase generateSlidePresentationUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _loadSlideSetupUseCase = loadSlideSetupUseCase,
       _toggleObjectifSelectionUseCase = toggleObjectifSelectionUseCase,
       _generateSlidePresentationUseCase = generateSlidePresentationUseCase,
       _presentationLauncher = presentationLauncher,
       super(SlideSetupState.initial());

  Future<void> load({int? historyEntryId}) async {
    emit(state.copyWith(catalogLoading: true, error: null));
    try {
      final result = await _loadSlideSetupUseCase.execute(
        historyEntryId: historyEntryId,
      );
      emit(
        state.copyWith(
          catalogLoading: false,
          catalog: result.catalog,
          timeframe: result.timeframe ?? state.timeframe,
          listSelectedObjectif: result.preselectedObjectifs,
          builtPresentation: result.existingPresentation,
        ),
      );
    } catch (error) {
      emit(state.copyWith(catalogLoading: false, error: error));
    }
  }

  void toggleObjectif(Objectif objectif) {
    final next = _toggleObjectifSelectionUseCase.execute(
      current: state.listSelectedObjectif,
      objectif: objectif,
    );
    emit(state.copyWith(listSelectedObjectif: next, builtPresentation: null));
  }

  void updateTimeframe(SlideTimeframe timeframe) {
    emit(state.copyWith(timeframe: timeframe, builtPresentation: null));
  }

  Future<void> generate() async {
    final catalog = state.catalog;
    if (!state.canGenerate || catalog == null) return;
    emit(state.copyWith(building: true, error: null, builtPresentation: null));
    try {
      final presentation = await _generateSlidePresentationUseCase.execute(
        timeframe: state.timeframe,
        catalog: catalog,
        selectedObjectif: state.listSelectedObjectif,
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

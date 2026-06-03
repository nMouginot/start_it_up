import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../../theme/domain/entity/slide_theme.dart';
import '../../../../theme/domain/use_case/decode_slide_theme_use_case.dart';
import '../../../../theme/domain/use_case/encode_slide_theme_use_case.dart';
import '../../../domain/entity/timeframe.dart';
import '../../../domain/use_case/generate_slide_presentation_use_case.dart';
import '../../../domain/use_case/load_slide_setup_use_case.dart';
import '../../../domain/use_case/toggle_objectif_selection_use_case.dart';
import '../../presentation_launcher.dart';
import 'slide_setup_state.dart';

class SlideSetupCubit extends Cubit<SlideSetupState> {
  final LoadSlideSetupUseCase _loadSlideSetupUseCase;
  final ToggleObjectifSelectionUseCase _toggleObjectifSelectionUseCase;
  final GenerateSlidePresentationUseCase _generateSlidePresentationUseCase;
  final DecodeSlideThemeUseCase _decodeSlideThemeUseCase;
  final EncodeSlideThemeUseCase _encodeSlideThemeUseCase;
  final PresentationLauncher _presentationLauncher;

  SlideSetupCubit({
    required LoadSlideSetupUseCase loadSlideSetupUseCase,
    required ToggleObjectifSelectionUseCase toggleObjectifSelectionUseCase,
    required GenerateSlidePresentationUseCase generateSlidePresentationUseCase,
    required DecodeSlideThemeUseCase decodeSlideThemeUseCase,
    required EncodeSlideThemeUseCase encodeSlideThemeUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _loadSlideSetupUseCase = loadSlideSetupUseCase,
       _toggleObjectifSelectionUseCase = toggleObjectifSelectionUseCase,
       _generateSlidePresentationUseCase = generateSlidePresentationUseCase,
       _decodeSlideThemeUseCase = decodeSlideThemeUseCase,
       _encodeSlideThemeUseCase = encodeSlideThemeUseCase,
       _presentationLauncher = presentationLauncher,
       super(SlideSetupState.initial());

  Future<void> load({int? historyEntryId}) async {
    emit(state.copyWith(projectsLoading: true, error: null));
    try {
      final result = await _loadSlideSetupUseCase.execute(
        historyEntryId: historyEntryId,
      );
      emit(
        state.copyWith(
          projectsLoading: false,
          projects: result.projects,
          timeframe: result.timeframe ?? state.timeframe,
          theme: result.theme ?? state.theme,
          listSelectedObjectif: result.preselectedObjectifs,
          builtPresentation: result.existingPresentation,
        ),
      );
    } catch (error) {
      emit(state.copyWith(projectsLoading: false, error: error));
    }
  }

  void toggleObjectif(Objectif objectif) {
    final next = _toggleObjectifSelectionUseCase.execute(
      current: state.listSelectedObjectif,
      objectif: objectif,
    );
    emit(state.copyWith(listSelectedObjectif: next, builtPresentation: null));
  }

  void updateTimeframe(Timeframe timeframe) {
    emit(state.copyWith(timeframe: timeframe, builtPresentation: null));
  }

  void updateTheme(SlideTheme theme) {
    emit(state.copyWith(theme: theme, builtPresentation: null));
  }

  void importThemeFromJson(String rawJson) {
    try {
      final theme = _decodeSlideThemeUseCase.execute(rawJson);
      emit(state.copyWith(theme: theme, builtPresentation: null, error: null));
    } catch (error) {
      emit(state.copyWith(error: error));
    }
  }

  String exportThemeAsJson() => _encodeSlideThemeUseCase.execute(state.theme);

  Future<void> generate() async {
    if (!state.canGenerate) return;
    emit(state.copyWith(building: true, error: null, builtPresentation: null));
    try {
      final presentation = await _generateSlidePresentationUseCase.execute(
        timeframe: state.timeframe,
        theme: state.theme,
        projects: state.projects,
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

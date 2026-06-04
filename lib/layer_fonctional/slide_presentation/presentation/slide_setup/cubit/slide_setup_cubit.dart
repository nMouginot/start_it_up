import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/domain/entity/slide_theme.dart';
import '../../../../theme/domain/use_case/decode_slide_theme_use_case.dart';
import '../../../../theme/domain/use_case/encode_slide_theme_use_case.dart';
import '../../../domain/entity/slide.dart';
import '../../../domain/entity/slide_template.dart';
import '../../../domain/entity/timeframe.dart';
import '../../../domain/use_case/generate_slide_presentation_use_case.dart';
import '../../../domain/use_case/load_slide_setup_use_case.dart';
import '../../presentation_launcher.dart';
import 'slide_setup_state.dart';

class SlideSetupCubit extends Cubit<SlideSetupState> {
  final LoadSlideSetupUseCase _loadSlideSetupUseCase;
  final GenerateSlidePresentationUseCase _generateSlidePresentationUseCase;
  final DecodeSlideThemeUseCase _decodeSlideThemeUseCase;
  final EncodeSlideThemeUseCase _encodeSlideThemeUseCase;
  final PresentationLauncher _presentationLauncher;

  SlideSetupCubit({
    required LoadSlideSetupUseCase loadSlideSetupUseCase,
    required GenerateSlidePresentationUseCase generateSlidePresentationUseCase,
    required DecodeSlideThemeUseCase decodeSlideThemeUseCase,
    required EncodeSlideThemeUseCase encodeSlideThemeUseCase,
    required List<SlideTemplate> templates,
    required PresentationLauncher presentationLauncher,
  }) : _loadSlideSetupUseCase = loadSlideSetupUseCase,
       _generateSlidePresentationUseCase = generateSlidePresentationUseCase,
       _decodeSlideThemeUseCase = decodeSlideThemeUseCase,
       _encodeSlideThemeUseCase = encodeSlideThemeUseCase,
       _presentationLauncher = presentationLauncher,
       super(SlideSetupState.initial(templates: templates));

  Future<void> load({int? historyEntryId}) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final result = await _loadSlideSetupUseCase.execute(
        historyEntryId: historyEntryId,
      );
      final theme = result.theme ?? state.theme;
      emit(
        state.copyWith(
          loading: false,
          slides: result.slides,
          timeframe: result.timeframe ?? state.timeframe,
          theme: theme,
          builtPresentation: result.existingPresentation,
          exportJson: _encodeSlideThemeUseCase.execute(theme),
        ),
      );
    } catch (error) {
      emit(state.copyWith(loading: false, error: error));
    }
  }

  void addSlide(SlideTemplate template) {
    final slide = template.createDefault(
      timeframe: state.timeframe,
      theme: state.theme,
    );
    emit(
      state.copyWith(slides: [...state.slides, slide], builtPresentation: null),
    );
  }

  void removeSlide(int index) {
    final next = List<Slide>.from(state.slides)..removeAt(index);
    emit(state.copyWith(slides: next, builtPresentation: null));
  }

  void duplicateSlide(int index) {
    final source = state.slides[index];
    final clone = source.copyWithCore();
    final next = List<Slide>.from(state.slides)..insert(index + 1, clone);
    emit(state.copyWith(slides: next, builtPresentation: null));
  }

  void reorderSlide(int oldIndex, int newIndex) {
    final next = List<Slide>.from(state.slides);
    final targetIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final moved = next.removeAt(oldIndex);
    next.insert(targetIndex, moved);
    emit(state.copyWith(slides: next, builtPresentation: null));
  }

  void replaceSlide(int index, Slide updated) {
    final next = List<Slide>.from(state.slides);
    next[index] = updated;
    emit(state.copyWith(slides: next, builtPresentation: null));
  }

  void updateTimeframe(Timeframe timeframe) {
    final propagated = state.slides
        .map((s) => s.copyWithCore(timeframe: timeframe))
        .toList();
    emit(
      state.copyWith(
        timeframe: timeframe,
        slides: propagated,
        builtPresentation: null,
      ),
    );
  }

  void updateTheme(SlideTheme theme) {
    final propagated = state.slides
        .map((s) => s.copyWithCore(theme: theme))
        .toList();
    emit(
      state.copyWith(
        theme: theme,
        slides: propagated,
        builtPresentation: null,
        exportJson: _encodeSlideThemeUseCase.execute(theme),
      ),
    );
  }

  void importThemeFromJson(String rawJson) {
    try {
      final theme = _decodeSlideThemeUseCase.execute(rawJson);
      updateTheme(theme);
      emit(state.copyWith(error: null));
    } catch (error) {
      emit(state.copyWith(error: error));
    }
  }

  Future<void> generate() async {
    if (!state.canGenerate) return;
    emit(state.copyWith(building: true, error: null, builtPresentation: null));
    try {
      final presentation = await _generateSlidePresentationUseCase.execute(
        slides: state.slides,
        timeframe: state.timeframe,
        theme: state.theme,
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

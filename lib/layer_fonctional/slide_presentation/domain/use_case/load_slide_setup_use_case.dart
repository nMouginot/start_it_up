import '../../../slide_presentation_history/domain/use_case/get_slide_presentation_history_use_case.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../entity/slide.dart';
import '../entity/slide_presentation.dart';
import '../entity/timeframe.dart';

typedef LoadSlideSetupResult = ({
  Timeframe? timeframe,
  SlideTheme? theme,
  List<Slide> slides,
  SlidePresentation? existingPresentation,
});

class LoadSlideSetupUseCase {
  final GetSlidePresentationHistoryUseCase _getHistoryUseCase;

  const LoadSlideSetupUseCase({
    required GetSlidePresentationHistoryUseCase getHistoryUseCase,
  }) : _getHistoryUseCase = getHistoryUseCase;

  Future<LoadSlideSetupResult> execute({int? historyEntryId}) async {
    if (historyEntryId == null) {
      return (
        timeframe: null,
        theme: null,
        slides: const <Slide>[],
        existingPresentation: null,
      );
    }
    final entries = await _getHistoryUseCase.execute();
    final entry = entries.where((e) => e.id == historyEntryId).firstOrNull;
    if (entry == null) {
      return (
        timeframe: null,
        theme: null,
        slides: const <Slide>[],
        existingPresentation: null,
      );
    }
    final presentation = entry.presentation;
    final firstSlide = presentation.slides.firstOrNull;
    return (
      timeframe: firstSlide?.timeframe,
      theme: presentation.theme,
      slides: presentation.slides,
      existingPresentation: presentation,
    );
  }
}

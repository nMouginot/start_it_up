import '../../../slide_presentation_history/domain/use_case/save_slide_presentation_history_use_case.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../entity/slide.dart';
import '../entity/slide_presentation.dart';
import '../entity/timeframe.dart';
import 'build_slide_presentation_use_case.dart';

class GenerateSlidePresentationUseCase {
  final BuildSlidePresentationUseCase _buildUseCase;
  final SaveSlidePresentationHistoryUseCase _saveUseCase;

  const GenerateSlidePresentationUseCase({
    required BuildSlidePresentationUseCase buildUseCase,
    required SaveSlidePresentationHistoryUseCase saveUseCase,
  }) : _buildUseCase = buildUseCase,
       _saveUseCase = saveUseCase;

  Future<SlidePresentation> execute({
    required List<Slide> slides,
    required Timeframe timeframe,
    required SlideTheme theme,
  }) async {
    final presentation = await _buildUseCase.execute(
      slides: slides,
      timeframe: timeframe,
      theme: theme,
    );
    await _saveUseCase.execute(presentation: presentation);
    return presentation;
  }
}

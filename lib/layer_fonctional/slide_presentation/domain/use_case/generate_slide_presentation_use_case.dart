import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../slide_presentation_history/domain/use_case/save_slide_presentation_history_use_case.dart';
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
    required Timeframe timeframe,
    required List<Project> projects,
    required List<Objectif> selectedObjectif,
  }) async {
    final presentation = await _buildUseCase.execute(
      timeframe: timeframe,
      projects: projects,
      selectedObjectif: selectedObjectif,
    );
    await _saveUseCase.execute(presentation: presentation);
    return presentation;
  }
}

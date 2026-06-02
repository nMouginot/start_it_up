import '../../../objectif/domain/entity/objectif.dart';
import '../../../project_catalog/domain/entity/project_catalog.dart';
import '../entity/slide_presentation.dart';
import '../entity/slide_timeframe.dart';
import 'build_slide_presentation_use_case.dart';
import 'save_slide_presentation_history_use_case.dart';

class GenerateSlidePresentationUseCase {
  final BuildSlidePresentationUseCase _buildUseCase;
  final SaveSlidePresentationHistoryUseCase _saveUseCase;

  const GenerateSlidePresentationUseCase({
    required BuildSlidePresentationUseCase buildUseCase,
    required SaveSlidePresentationHistoryUseCase saveUseCase,
  }) : _buildUseCase = buildUseCase,
       _saveUseCase = saveUseCase;

  Future<SlidePresentation> execute({
    required SlideTimeframe timeframe,
    required ProjectCatalog catalog,
    required List<Objectif> selectedObjectif,
  }) async {
    final presentation = await _buildUseCase.execute(
      timeframe: timeframe,
      catalog: catalog,
      selectedObjectif: selectedObjectif,
    );
    await _saveUseCase.execute(presentation: presentation);
    return presentation;
  }
}

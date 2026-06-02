import '../../../objectif/domain/entity/objectif.dart';
import '../../../project_catalog/domain/entity/project_catalog.dart';
import '../../../project_catalog/domain/use_case/get_project_catalog_use_case.dart';
import '../entity/slide_presentation.dart';
import '../entity/slide_timeframe.dart';
import 'get_slide_presentation_history_by_id_use_case.dart';

typedef LoadSlideSetupResult = ({
  ProjectCatalog catalog,
  SlideTimeframe? timeframe,
  List<Objectif> preselectedObjectifs,
  SlidePresentation? existingPresentation,
});

class LoadSlideSetupUseCase {
  final GetProjectCatalogUseCase _getProjectCatalogUseCase;
  final GetSlidePresentationHistoryByIdUseCase _getHistoryByIdUseCase;

  const LoadSlideSetupUseCase({
    required GetProjectCatalogUseCase getProjectCatalogUseCase,
    required GetSlidePresentationHistoryByIdUseCase getHistoryByIdUseCase,
  }) : _getProjectCatalogUseCase = getProjectCatalogUseCase,
       _getHistoryByIdUseCase = getHistoryByIdUseCase;

  Future<LoadSlideSetupResult> execute({int? historyEntryId}) async {
    final catalog = await _getProjectCatalogUseCase.execute();
    if (historyEntryId == null) {
      return (
        catalog: catalog,
        timeframe: null,
        preselectedObjectifs: const <Objectif>[],
        existingPresentation: null,
      );
    }
    final dto = await _getHistoryByIdUseCase.execute(historyEntryId);
    if (dto == null) {
      return (
        catalog: catalog,
        timeframe: null,
        preselectedObjectifs: const <Objectif>[],
        existingPresentation: null,
      );
    }
    return (
      catalog: catalog,
      timeframe: dto.presentation.timeframe,
      preselectedObjectifs: dto.presentation.allObjectifs.toList(),
      existingPresentation: dto.presentation,
    );
  }
}

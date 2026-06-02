import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../project_catalog/domain/use_case/get_project_catalog_use_case.dart';
import '../data/repository/slide_presentation_history_repository.dart';
import '../presentation/presentation_launcher.dart';
import '../presentation/slide_history/cubit/slide_history_cubit.dart';
import '../presentation/slide_setup/cubit/slide_setup_cubit.dart';
import 'use_case/build_slide_presentation_use_case.dart';
import 'use_case/generate_slide_presentation_use_case.dart';
import 'use_case/get_slide_presentation_history_by_id_use_case.dart';
import 'use_case/get_slide_presentation_history_use_case.dart';
import 'use_case/load_slide_setup_use_case.dart';
import 'use_case/save_slide_presentation_history_use_case.dart';
import 'use_case/toggle_objectif_selection_use_case.dart';

class SlidePresentationInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<PresentationLauncher>(
      () => PresentationLauncher(),
    );
    locator.registerLazySingleton<SlidePresentationHistoryRepository>(
      () => SlidePresentationHistoryRepository(),
    );
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(() => const BuildSlidePresentationUseCase());
    locator.registerLazySingleton(
      () => SaveSlidePresentationHistoryUseCase(
        repository: locator<SlidePresentationHistoryRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => GetSlidePresentationHistoryUseCase(
        repository: locator<SlidePresentationHistoryRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => GetSlidePresentationHistoryByIdUseCase(
        repository: locator<SlidePresentationHistoryRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => LoadSlideSetupUseCase(
        getProjectCatalogUseCase: locator<GetProjectCatalogUseCase>(),
        getHistoryByIdUseCase:
            locator<GetSlidePresentationHistoryByIdUseCase>(),
      ),
    );
    locator.registerLazySingleton(
      () => const ToggleObjectifSelectionUseCase(),
    );
    locator.registerLazySingleton(
      () => GenerateSlidePresentationUseCase(
        buildUseCase: locator<BuildSlidePresentationUseCase>(),
        saveUseCase: locator<SaveSlidePresentationHistoryUseCase>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactory(
      () => SlideSetupCubit(
        loadSlideSetupUseCase: locator<LoadSlideSetupUseCase>(),
        toggleObjectifSelectionUseCase:
            locator<ToggleObjectifSelectionUseCase>(),
        generateSlidePresentationUseCase:
            locator<GenerateSlidePresentationUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
    locator.registerFactory(
      () => SlideHistoryCubit(
        getHistoryUseCase: locator<GetSlidePresentationHistoryUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
  }
}

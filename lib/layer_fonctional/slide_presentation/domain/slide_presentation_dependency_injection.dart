import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../project/domain/use_case/get_projects_use_case.dart';
import '../../slide_presentation_history/domain/use_case/get_slide_presentation_history_use_case.dart';
import '../../slide_presentation_history/domain/use_case/save_slide_presentation_history_use_case.dart';
import '../../theme/domain/use_case/decode_slide_theme_use_case.dart';
import '../../theme/domain/use_case/encode_slide_theme_use_case.dart';
import '../presentation/presentation_launcher.dart';
import '../presentation/slide_setup/cubit/slide_setup_cubit.dart';
import 'use_case/build_slide_presentation_use_case.dart';
import 'use_case/generate_slide_presentation_use_case.dart';
import 'use_case/load_slide_setup_use_case.dart';
import 'use_case/toggle_objectif_selection_use_case.dart';

class SlidePresentationInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<PresentationLauncher>(
      () => PresentationLauncher(),
    );
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(() => const BuildSlidePresentationUseCase());
    locator.registerLazySingleton(
      () => LoadSlideSetupUseCase(
        getProjectsUseCase: locator<GetProjectsUseCase>(),
        getHistoryUseCase: locator<GetSlidePresentationHistoryUseCase>(),
      ),
    );
    locator.registerLazySingleton(() => const ToggleObjectifSelectionUseCase());
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
        decodeSlideThemeUseCase: locator<DecodeSlideThemeUseCase>(),
        encodeSlideThemeUseCase: locator<EncodeSlideThemeUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
  }
}

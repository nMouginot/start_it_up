import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../project_slide_block/domain/entity/project_slide_block.dart';
import '../../slide_overview/domain/entity/slide_overview.dart';
import '../../slide_presentation_history/domain/use_case/get_slide_presentation_history_use_case.dart';
import '../../slide_presentation_history/domain/use_case/save_slide_presentation_history_use_case.dart';
import '../../slide_timeframe/domain/entity/slide_intro.dart';
import '../../theme/domain/use_case/decode_slide_theme_use_case.dart';
import '../../theme/domain/use_case/encode_slide_theme_use_case.dart';
import '../presentation/presentation_launcher.dart';
import '../presentation/slide_setup/cubit/slide_setup_cubit.dart';
import 'entity/slide_template.dart';
import 'use_case/build_slide_presentation_use_case.dart';
import 'use_case/generate_slide_presentation_use_case.dart';
import 'use_case/load_slide_setup_use_case.dart';

class SlidePresentationInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<PresentationLauncher>(
      () => PresentationLauncher(),
    );
    locator.registerLazySingleton<List<SlideTemplate>>(
      () => [
        SlideTimeframe.template,
        SlideOverview.template,
        ProjectSlideBlock.template,
      ],
    );
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(() => const BuildSlidePresentationUseCase());
    locator.registerLazySingleton(
      () => LoadSlideSetupUseCase(
        getHistoryUseCase: locator<GetSlidePresentationHistoryUseCase>(),
      ),
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
        generateSlidePresentationUseCase:
            locator<GenerateSlidePresentationUseCase>(),
        decodeSlideThemeUseCase: locator<DecodeSlideThemeUseCase>(),
        encodeSlideThemeUseCase: locator<EncodeSlideThemeUseCase>(),
        templates: locator<List<SlideTemplate>>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
  }
}

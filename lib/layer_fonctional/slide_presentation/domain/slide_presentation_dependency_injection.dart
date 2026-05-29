import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../project_catalog/domain/use_case/get_project_catalog_use_case.dart';
import '../presentation/presentation_launcher.dart';
import '../presentation/slide_setup/cubit/slide_setup_cubit.dart';
import 'use_case/build_slide_presentation_use_case.dart';

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
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerLazySingleton(
      () => SlideSetupCubit(
        getProjectCatalogUseCase: locator<GetProjectCatalogUseCase>(),
        buildSlidePresentationUseCase: locator<BuildSlidePresentationUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
  }
}

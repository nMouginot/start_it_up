import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../projet_catalog/domain/use_case/get_projet_catalog_use_case.dart';
import '../presentation/cubit/sprint_setup_cubit.dart';
import '../presentation/presentation_launcher.dart';
import 'use_case/build_sprint_presentation_use_case.dart';

class SprintPresentationInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<PresentationLauncher>(
      () => PresentationLauncher(),
    );
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => const BuildSprintPresentationUseCase(),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerLazySingleton(
      () => SprintSetupCubit(
        getProjetCatalogUseCase: locator<GetProjetCatalogUseCase>(),
        buildSprintPresentationUseCase:
            locator<BuildSprintPresentationUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
  }
}

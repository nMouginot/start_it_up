import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../objectif/domain/use_case/get_objectifs_by_projet_use_case.dart';
import '../../projet/domain/use_case/get_projets_use_case.dart';
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
      () => BuildSprintPresentationUseCase(
        getObjectifsByProjetUseCase: locator<GetObjectifsByProjetUseCase>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerLazySingleton(
      () => SprintSetupCubit(
        getProjetsUseCase: locator<GetProjetsUseCase>(),
        buildSprintPresentationUseCase:
            locator<BuildSprintPresentationUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      ),
    );
  }
}

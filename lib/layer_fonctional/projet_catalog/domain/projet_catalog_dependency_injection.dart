import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../objectif/domain/use_case/get_objectifs_by_projet_use_case.dart';
import '../../projet/domain/use_case/get_projets_use_case.dart';
import 'use_case/get_projet_catalog_use_case.dart';

class ProjetCatalogInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {}

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => GetProjetCatalogUseCase(
        getProjetsUseCase: locator<GetProjetsUseCase>(),
        getObjectifsByProjetUseCase: locator<GetObjectifsByProjetUseCase>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {}
}

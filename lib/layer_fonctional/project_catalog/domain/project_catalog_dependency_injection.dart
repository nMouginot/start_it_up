import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../objectif/domain/use_case/get_objectifs_by_project_use_case.dart';
import '../../project/domain/use_case/get_projects_use_case.dart';
import 'use_case/get_project_catalog_use_case.dart';

class ProjectCatalogInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {}

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => GetProjectCatalogUseCase(
        getProjectsUseCase: locator<GetProjectsUseCase>(),
        getObjectifsByProjectUseCase: locator<GetObjectifsByProjectUseCase>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {}
}

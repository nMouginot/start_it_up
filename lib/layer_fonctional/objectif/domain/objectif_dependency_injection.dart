import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../data/repository/objectif_repository.dart';
import 'use_case/get_objectifs_by_projet_use_case.dart';

class ObjectifInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<ObjectifRepository>(
      () => ObjectifRepository(),
    );
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => GetObjectifsByProjetUseCase(
        objectifRepository: locator<ObjectifRepository>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {}
}

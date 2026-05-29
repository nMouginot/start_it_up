import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../data/repository/projet_repository.dart';
import '../presentation/cubit/projet_list_cubit.dart';
import 'use_case/get_projets_use_case.dart';

class ProjetInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<ProjetRepository>(() => ProjetRepository());
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => GetProjetsUseCase(projetRepository: locator<ProjetRepository>()),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactory(
      () => ProjetListCubit(getProjetsUseCase: locator<GetProjetsUseCase>()),
    );
  }
}

import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../objectif/domain/use_case/get_objectifs_by_projet_use_case.dart';
import '../data/repository/projet_repository.dart';
import '../presentation/projet_detail/cubit/projet_detail_cubit.dart';
import '../presentation/projet_list/cubit/projet_list_cubit.dart';
import 'use_case/get_projet_by_id_use_case.dart';
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
    locator.registerLazySingleton(
      () => GetProjetByIdUseCase(projetRepository: locator<ProjetRepository>()),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactory(
      () => ProjetListCubit(getProjetsUseCase: locator<GetProjetsUseCase>()),
    );
    locator.registerFactory(
      () => ProjetDetailCubit(
        getProjetByIdUseCase: locator<GetProjetByIdUseCase>(),
        getObjectifsByProjetUseCase: locator<GetObjectifsByProjetUseCase>(),
      ),
    );
  }
}

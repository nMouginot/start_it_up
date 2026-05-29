import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../projet/domain/use_case/get_projets_use_case.dart';
import '../data/repository/objectif_repository.dart';
import '../presentation/objectif_create/cubit/objectif_create_cubit.dart';
import 'use_case/create_objectif_use_case.dart';
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
    locator.registerLazySingleton(
      () => CreateObjectifUseCase(
        objectifRepository: locator<ObjectifRepository>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactoryParam<ObjectifCreateCubit, int?, void>(
      (initialProjetId, _) => ObjectifCreateCubit(
        getProjetsUseCase: locator<GetProjetsUseCase>(),
        createObjectifUseCase: locator<CreateObjectifUseCase>(),
        initialProjetId: initialProjetId,
      ),
    );
  }
}

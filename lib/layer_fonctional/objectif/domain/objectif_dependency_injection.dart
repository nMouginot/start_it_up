import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../project/domain/use_case/get_projects_use_case.dart';
import '../data/repository/objectif_repository.dart';
import 'entity/objectif.dart' show Objectif;
import '../presentation/objectif_form/cubit/objectif_form_cubit.dart';
import 'use_case/create_objectif_use_case.dart';
import 'use_case/get_objectifs_by_project_use_case.dart';
import 'use_case/update_objectif_use_case.dart';

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
      () => GetObjectifsByProjectUseCase(
        objectifRepository: locator<ObjectifRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => CreateObjectifUseCase(
        objectifRepository: locator<ObjectifRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => UpdateObjectifUseCase(
        objectifRepository: locator<ObjectifRepository>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactoryParam<ObjectifFormCubit, int?, Objectif?>(
      (initialProjectId, existing) => ObjectifFormCubit(
        getProjectsUseCase: locator<GetProjectsUseCase>(),
        createObjectifUseCase: locator<CreateObjectifUseCase>(),
        updateObjectifUseCase: locator<UpdateObjectifUseCase>(),
        initialProjectId: initialProjectId,
        existing: existing,
      ),
    );
  }
}

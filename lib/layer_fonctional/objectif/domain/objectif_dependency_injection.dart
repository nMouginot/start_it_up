import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../project/data/repository/project_repository.dart';
import '../../project/domain/use_case/get_projects_use_case.dart';
import '../data/repository/objectif_repository.dart';
import '../presentation/objectif_form/cubit/objectif_form_cubit.dart';
import 'entity/objectif.dart' show Objectif;
import 'use_case/create_objectif_use_case.dart';
import 'use_case/get_objectifs_by_project_use_case.dart';
import 'use_case/update_objectif_use_case.dart';
import 'use_case/upsert_objectif_use_case.dart';

class ObjectifInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<ObjectifRepository>(
      () => ObjectifRepository(projectRepository: locator<ProjectRepository>()),
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
    locator.registerLazySingleton(
      () => UpsertObjectifUseCase(
        create: locator<CreateObjectifUseCase>(),
        update: locator<UpdateObjectifUseCase>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactoryParam<ObjectifFormCubit, int?, Objectif?>(
      (initialProjectId, existing) => ObjectifFormCubit(
        getProjectsUseCase: locator<GetProjectsUseCase>(),
        upsertObjectifUseCase: locator<UpsertObjectifUseCase>(),
        initialProjectId: initialProjectId,
        existing: existing,
      ),
    );
  }
}

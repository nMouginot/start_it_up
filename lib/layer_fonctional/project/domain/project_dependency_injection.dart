import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../data/repository/project_repository.dart';
import '../presentation/project_detail/cubit/project_detail_cubit.dart';
import '../presentation/project_form/cubit/project_form_cubit.dart';
import '../presentation/project_list/cubit/project_list_cubit.dart';
import 'entity/project.dart' show Project;
import 'use_case/create_project_use_case.dart';
import 'use_case/get_project_by_id_use_case.dart';
import 'use_case/get_projects_use_case.dart';
import 'use_case/update_project_use_case.dart';
import 'use_case/upsert_project_use_case.dart';

class ProjectInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<ProjectRepository>(() => ProjectRepository());
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => GetProjectsUseCase(projectRepository: locator<ProjectRepository>()),
    );
    locator.registerLazySingleton(
      () => GetProjectByIdUseCase(
        projectRepository: locator<ProjectRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () =>
          CreateProjectUseCase(projectRepository: locator<ProjectRepository>()),
    );
    locator.registerLazySingleton(
      () =>
          UpdateProjectUseCase(projectRepository: locator<ProjectRepository>()),
    );
    locator.registerLazySingleton(
      () => UpsertProjectUseCase(
        create: locator<CreateProjectUseCase>(),
        update: locator<UpdateProjectUseCase>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactory(
      () => ProjectListCubit(getProjectsUseCase: locator<GetProjectsUseCase>()),
    );
    locator.registerFactory(
      () => ProjectDetailCubit(
        getProjectByIdUseCase: locator<GetProjectByIdUseCase>(),
      ),
    );
    locator.registerFactoryParam<ProjectFormCubit, Project?, void>(
      (existing, _) => ProjectFormCubit(
        upsertProjectUseCase: locator<UpsertProjectUseCase>(),
        existing: existing,
      ),
    );
  }
}

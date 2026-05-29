import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../objectif/domain/use_case/get_objectifs_by_project_use_case.dart';
import '../data/repository/project_repository.dart';
import '../presentation/project_detail/cubit/project_detail_cubit.dart';
import '../presentation/project_list/cubit/project_list_cubit.dart';
import 'use_case/get_project_by_id_use_case.dart';
import 'use_case/get_projects_use_case.dart';

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
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactory(
      () => ProjectListCubit(getProjectsUseCase: locator<GetProjectsUseCase>()),
    );
    locator.registerFactory(
      () => ProjectDetailCubit(
        getProjectByIdUseCase: locator<GetProjectByIdUseCase>(),
        getObjectifsByProjectUseCase: locator<GetObjectifsByProjectUseCase>(),
      ),
    );
  }
}

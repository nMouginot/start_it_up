import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../data/repository/user_repository.dart';
import 'use_case/get_authenticated_user_use_case.dart';

class ReservationInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<UserRepository>(() => UserRepository());
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => GetAuthenticatedUserUseCase(
        userRepository: locator<UserRepository>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    // Nothing to register ! example -> locator.registerFactory(() => ReservationCubit(locator(), locator()));
  }
}

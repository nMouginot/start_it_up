import 'package:get_it/get_it.dart';

abstract interface class FeatureInjector {
  void registerRepositories(GetIt locator) {}
  void registerUseCases(GetIt locator) {}
  void registerCubits(GetIt locator) {}
}

// Example !
// class ReservationInjector implements FeatureInjector {
//   @override
//   void registerRepositories(GetIt locator) {
//     locator.registerLazySingleton<ReservationRepository>(
//       () => ReservationRepositoryImpl(locator()),
//     );
//   }

//   @override
//   void registerUseCases(GetIt locator) {
//     locator.registerLazySingleton(() => CreateReservationUseCase(locator()));
//     locator.registerLazySingleton(() => DeleteReservationUseCase(locator()));
//   }

//   @override
//   void registerCubits(GetIt locator) {
//     locator.registerFactory(() => ReservationCubit(locator(), locator()));
//   }

// }

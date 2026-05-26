import 'package:get_it/get_it.dart';

import '../navigation/data/app_router.dart';
import '../navigation/domain/guards/auth_guard.dart';

// import 'get_it_extension.dart';

final locator = GetIt.instance;

Future<void> appDependencyInjection() async {
  _registerTechnical();
  _registerFeatures();
}

void _registerTechnical() {
  locator.registerLazySingleton(() => AuthGuard());
  locator.registerLazySingleton(() => AppRouter(locator()));
}

void _registerFeatures() {
  // final features = <FeatureInjector>[
  //   PlaceInjector(),
  //   AuthInjector(),
  //   ReservationInjector(),
  // ];

  // for (final feature in features) {
  //   feature.registerRepositories(locator);
  //   feature.registerUseCases(locator);
  //   feature.registerCubits(locator);
  // }
}

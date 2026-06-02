import 'package:get_it/get_it.dart';

import '../../layer_fonctional/objectif/domain/objectif_dependency_injection.dart';
import '../../layer_fonctional/project/domain/project_dependency_injection.dart';
import '../../layer_fonctional/slide_presentation/domain/slide_presentation_dependency_injection.dart';
import '../../layer_fonctional/slide_presentation_history/domain/slide_presentation_history_dependency_injection.dart';
import '../navigation/data/app_router.dart';
import '../navigation/domain/guards/auth_guard.dart';
import 'feature_injector.dart';

final locator = GetIt.instance;

Future<void> appDependencyInjection() async {
  _registerTechnical();
  _registerFeatures();
}

void _registerTechnical() {
  locator.registerLazySingleton(() => const AuthGuard());
  locator.registerLazySingleton(() => AppRouter(locator()));
}

void _registerFeatures() {
  final features = <FeatureInjector>[
    ProjectInjector(),
    ObjectifInjector(),
    SlidePresentationHistoryInjector(),
    SlidePresentationInjector(),
  ];

  for (final feature in features) {
    feature.registerRepositories(locator);
    feature.registerUseCases(locator);
    feature.registerCubits(locator);
  }
}

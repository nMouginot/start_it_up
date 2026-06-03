import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import 'use_case/decode_slide_theme_use_case.dart';
import 'use_case/encode_slide_theme_use_case.dart';

class ThemeInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {}

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(() => const DecodeSlideThemeUseCase());
    locator.registerLazySingleton(() => const EncodeSlideThemeUseCase());
  }

  @override
  void registerCubits(GetIt locator) {}
}

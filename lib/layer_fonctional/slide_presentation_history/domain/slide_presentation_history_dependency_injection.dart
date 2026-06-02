import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../data/repository/slide_presentation_history_repository.dart';
import '../presentation/cubit/slide_presentation_history_cubit.dart';
import 'use_case/get_slide_presentation_history_use_case.dart';
import 'use_case/save_slide_presentation_history_use_case.dart';

class SlidePresentationHistoryInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<SlidePresentationHistoryRepository>(
      () => SlidePresentationHistoryRepository(),
    );
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => SaveSlidePresentationHistoryUseCase(
        repository: locator<SlidePresentationHistoryRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => GetSlidePresentationHistoryUseCase(
        repository: locator<SlidePresentationHistoryRepository>(),
      ),
    );
  }

  @override
  void registerCubits(GetIt locator) {
    locator.registerFactory(
      () => SlidePresentationHistoryCubit(
        getHistoryUseCase: locator<GetSlidePresentationHistoryUseCase>(),
      ),
    );
  }
}

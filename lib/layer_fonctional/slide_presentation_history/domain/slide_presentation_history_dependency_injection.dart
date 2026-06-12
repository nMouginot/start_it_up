import 'package:get_it/get_it.dart';

import '../../../layer_technical/dependency_injection/feature_injector.dart';
import '../../../layer_technical/history/domain/use_case/get_history_use_case.dart';
import '../../../layer_technical/history/domain/use_case/save_history_use_case.dart';
import '../presentation/cubit/slide_presentation_history_cubit.dart';
import 'use_case/get_slide_presentation_history_use_case.dart';
import 'use_case/save_slide_presentation_history_use_case.dart';

class SlidePresentationHistoryInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {}

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => SaveSlidePresentationHistoryUseCase(
        saveHistory: locator<SaveHistoryUseCase>(),
        getHistory: locator<GetHistoryUseCase>(),
      ),
    );
    locator.registerLazySingleton(
      () => GetSlidePresentationHistoryUseCase(
        getHistory: locator<GetHistoryUseCase>(),
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

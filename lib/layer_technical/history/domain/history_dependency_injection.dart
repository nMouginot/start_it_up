import 'package:get_it/get_it.dart';

import '../../dependency_injection/feature_injector.dart';
import '../data/storage/history_storage_io.dart'
    if (dart.library.js_interop) '../data/storage/history_storage_web.dart';
import 'storage/history_storage.dart';
import 'use_case/get_history_use_case.dart';
import 'use_case/save_history_use_case.dart';

class HistoryInjector implements FeatureInjector {
  @override
  void registerRepositories(GetIt locator) {
    locator.registerLazySingleton<HistoryStorage>(createHistoryStorage);
  }

  @override
  void registerUseCases(GetIt locator) {
    locator.registerLazySingleton(
      () => SaveHistoryUseCase(storage: locator<HistoryStorage>()),
    );
    locator.registerLazySingleton(
      () => GetHistoryUseCase(storage: locator<HistoryStorage>()),
    );
  }

  @override
  void registerCubits(GetIt locator) {}
}

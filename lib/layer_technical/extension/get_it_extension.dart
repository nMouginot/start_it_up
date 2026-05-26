import 'package:get_it/get_it.dart';

extension GetItExtensions on GetIt {
  /// Ensures [T] is registered in GetIt.
  /// - Defaults to `registerFactory` (non-singleton).
  /// - Can optionally use `registerSingleton` or `registerLazySingleton`.
  void ensureRegistered<T extends Object>(
    T Function() factory, {
    bool asSingleton = false,
    bool asLazySingleton = false,
  }) {
    if (!isRegistered<T>()) {
      if (asLazySingleton) {
        registerLazySingleton<T>(factory);
      } else if (asSingleton) {
        registerSingleton<T>(factory());
      } else {
        registerFactory<T>(factory);
      }
    }
  }
}

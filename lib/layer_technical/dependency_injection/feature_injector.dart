import 'package:get_it/get_it.dart';

abstract interface class FeatureInjector {
  void registerRepositories(GetIt locator) {}
  void registerUseCases(GetIt locator) {}
  void registerCubits(GetIt locator) {}
}

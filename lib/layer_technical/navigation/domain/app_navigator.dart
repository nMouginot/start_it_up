import 'package:go_router/go_router.dart';

import 'interface/navigatable.dart';
import 'navigation_exception.dart';

// layer_technical/navigation/app_navigator.dart
class AppNavigator {
  final GoRouter _router;

  AppNavigator(this._router);

  void pop() => _router.pop();

  void push(String path) => _router.push(path);

  void pushNavigatable<T extends Navigatable>(String path, T object) {
    _router.push(
      Uri(path: path, queryParameters: {'id': object.navigationId}).toString(),
      extra: object,
    );
  }

  /// Returns extra as [T] if available, otherwise falls back to query param 'id'.
  /// Throws [MissingNavigationIdException] if both are unavailable.
  static (T? extra, String id) extractNavigatable<T extends Navigatable>(
    GoRouterState state,
  ) {
    final object = _extractExtra<T>(state);
    final id = object?.navigationId ?? state.uri.queryParameters['id'];

    if (id == null) throw MissingNavigationIdException(state.matchedLocation);

    return (object, id);
  }

  /// Returns extra as [T] if available, null otherwise.
  /// Throws [InvalidExtraTypeException] if extra exists but is not of type [T].
  static T? _extractExtra<T extends Navigatable>(GoRouterState state) {
    if (state.extra == null) return null;
    if (state.extra is! T) {
      throw InvalidExtraTypeException(T.toString(), state.matchedLocation);
    }
    return state.extra as T;
  }
}

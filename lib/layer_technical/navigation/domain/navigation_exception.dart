sealed class NavigationException implements Exception {
  const NavigationException(this.message);
  final String message;

  @override
  String toString() => '$NavigationException: $message';
}

final class MissingNavigationIdException extends NavigationException {
  const MissingNavigationIdException(String route)
    : super(
        'Missing id for route "$route". Extra was null and no query parameter "id" was found.',
      );
}

final class InvalidExtraTypeException extends NavigationException {
  const InvalidExtraTypeException(String expected, String route)
    : super('Invalid extra type on route "$route". Expected "$expected".');
}

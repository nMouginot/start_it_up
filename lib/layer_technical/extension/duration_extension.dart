extension DurationExtensions on Duration {
  /// Returns H:MM:SS, stripping fractional seconds if present.
  String toHmsString() {
    final str = toString();
    final dotIndex = str.indexOf('.');
    return dotIndex == -1 ? str : str.substring(0, dotIndex);
  }

  /// Returns H'h'MM, stripping fractional seconds and seconds.
  String toHmString() {
    final str = toString();
    final dotIndex = str.indexOf('.');

    final withoutFractional = dotIndex == -1 ? str : str.substring(0, dotIndex);

    return withoutFractional
        .substring(0, withoutFractional.length - 3)
        .replaceAll(':', 'h');
  }
}

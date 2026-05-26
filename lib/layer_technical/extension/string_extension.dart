extension CapitalizeFirstExtensions on String {
  String get capitalizeFirst =>
      (isNotEmpty) ? this[0].toUpperCase() + substring(1).toLowerCase() : this;
}

enum TranslationLanguage {
  french(languageCode: 'fr', regionalCode: 'FR', selectorName: 'Français'),
  english(languageCode: 'en', regionalCode: 'US', selectorName: 'English');

  final String languageCode;
  final String regionalCode;
  final String selectorName;
  const TranslationLanguage({
    required this.languageCode,
    required this.regionalCode,
    required this.selectorName,
  });
}

enum TypeEnum {
  int('int'),
  num('num'),
  double('double'),
  string('String'),
  dateTime('DateTime');

  final String typo;
  const TypeEnum(this.typo);
}

/// The int, double, and num types can use any of the following NumberFormat constructors
///
/// Doc -> https://docs.flutter.dev/ui/internationalization#setting-up:~:text=The%20int%2C%20double%2C%20and%20num%20types%20can%20use%20any%20of%20the%20following%20NumberFormat%20constructors%3A
enum FormatEnum {
  compact,
  compactCurrency,
  compactSimpleCurrency,
  compactLong,
  currency,
  decimalPattern,
  decimalPatternDigits,
  decimalPercentPattern,
  percentPattern,
  scientificPattern,
  simpleCurrency,
}

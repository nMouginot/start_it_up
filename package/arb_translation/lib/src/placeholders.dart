import 'models/translation_line.dart';

class Placeholders {
  /// String type placeholder
  static PlaceholderInfo string({String? description, String? example}) {
    return PlaceholderInfo(
      type: TypeEnum.string,
      description: description,
      example: example,
    );
  }

  /// Integer type placeholder
  static PlaceholderInfo integer({String? description, String? example}) {
    return PlaceholderInfo(
      type: TypeEnum.int,
      description: description,
      example: example ?? '5',
    );
  }

  /// Double type placeholder
  static PlaceholderInfo double({String? description, String? example}) {
    return PlaceholderInfo(
      type: TypeEnum.double,
      description: description,
      example: example ?? '5.5',
    );
  }

  /// Number type placeholder (int or double)
  static PlaceholderInfo number({String? description, String? example}) {
    return PlaceholderInfo(
      type: TypeEnum.num,
      description: description,
      example: example,
    );
  }

  /// DateTime type placeholder
  static PlaceholderInfo dateTime({String? description, String? example}) {
    return PlaceholderInfo(
      type: TypeEnum.dateTime,
      description: description,
      example: example,
    );
  }

  /// Compact number format (e.g., 1K, 1.2M)
  static PlaceholderInfo compact({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.compact,
      description: description,
      example: example ?? '1.2K',
    );
  }

  /// Currency format (e.g., $1,234.56)
  static PlaceholderInfo currency({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.simpleCurrency,
      description: description,
      example: example ?? r'$1234.56',
    );
  }

  /// Percentage format (e.g., 45%)
  static PlaceholderInfo percent({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.percentPattern,
      description: description,
      example: example ?? '45%',
    );
  }

  /// Decimal percentage format (e.g., 45.67%)
  static PlaceholderInfo decimalPercent({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.decimalPercentPattern,
      description: description,
      example: example ?? '45.67%',
    );
  }

  /// Scientific notation format (e.g., 1.23E4)
  static PlaceholderInfo scientific({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.scientificPattern,
      description: description,
      example: example ?? '1.23E4',
    );
  }

  /// Decimal pattern format
  static PlaceholderInfo decimalPattern({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.decimalPattern,
      description: description,
      example: example,
    );
  }

  /// Decimal pattern with specific digits
  static PlaceholderInfo decimalPatternDigits({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.decimalPatternDigits,
      description: description,
      example: example,
    );
  }

  /// Compact long format (e.g., "1.2 thousand")
  static PlaceholderInfo compactLong({
    String? description,
    String? example,
    TypeEnum type = TypeEnum.num,
  }) {
    return PlaceholderInfo(
      type: type,
      format: FormatEnum.compactLong,
      description: description,
      example: example ?? '1.2 thousand',
    );
  }
}

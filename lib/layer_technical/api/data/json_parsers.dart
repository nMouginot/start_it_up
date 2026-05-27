// layer_technical/serialization/json_parsers.dart
import '../../extension/date_time_extension.dart';

abstract final class JsonParsers {
  static int? idFromJson(Object? value) => value is num
      ? value.toInt()
      : (value is String ? int.tryParse(value) : null);

  static Object? idToJson(int? value) => value;

  static bool? boolFromJson(Object? value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      return value.toLowerCase() == '1' || value.toLowerCase() == 'true';
    }
    return null;
  }

  static Object? boolToJsonAsInt(bool? value) => (value ?? false) ? 1 : 0;

  static DateTime? dateTimeFromJson(Object? value) {
    if (value == null || value is! String) return null;
    return DateTime.tryParse(value)?.toLocal();
  }

  static String? dateTimeToJson(DateTime? value) {
    return value?.toBackendString();
  }
}

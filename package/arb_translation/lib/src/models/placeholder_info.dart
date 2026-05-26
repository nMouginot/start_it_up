import 'enums.dart';

/// User [Placeholders] class to find preset [PlaceholderInfo]
class PlaceholderInfo {
  final TypeEnum type;
  final FormatEnum? format;
  final String? example;
  final String? description;

  PlaceholderInfo({
    required this.type,

    this.format,
    this.example,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.typo,
      if (format != null) 'format': format?.name,
      if (example != null) 'example': example,
      if (description != null) 'description': description,
    };
  }
}

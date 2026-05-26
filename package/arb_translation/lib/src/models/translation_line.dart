import 'placeholder_info.dart';
export 'placeholder_info.dart';
import 'text_translation.dart';
export 'text_translation.dart';
import 'enums.dart';
export 'enums.dart';

class TranslationLine {
  final String key;
  final String? description;
  final Map<String, PlaceholderInfo>? placeholders;
  final Map<TranslationLanguage, TextTranslation> translations;

  TranslationLine({
    required this.key,
    required this.translations,

    this.description,
    this.placeholders,
  });

  Map<String, dynamic> toArbMap(TranslationLanguage language) {
    final result = <String, dynamic>{
      key: translations[language]?.toArbString(),
    };

    final metadataMap = <String, dynamic>{
      if (description != null) 'description': description,
      if (placeholders != null && placeholders!.isNotEmpty)
        'placeholders': _placeholdersToMap(),
    };

    if (metadataMap.isNotEmpty) {
      result['@$key'] = metadataMap;
    }
    return result;
  }

  Map<String, dynamic> _placeholdersToMap() {
    return placeholders!.map((key, value) => MapEntry(key, value.toMap()));
  }
}

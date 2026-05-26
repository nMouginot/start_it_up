import 'dart:convert';

import 'models/translation_line.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class ArbFileGenerator {
  final String outputDirectory;
  final String arbFilePrefix;

  ArbFileGenerator({
    this.outputDirectory = 'lib/layer_technical/i18n/l10n',
    this.arbFilePrefix = 'app',
  });

  void generate(List<TranslationLine> translations) {
    _validateTranslations(translations);

    final outputDir = Directory(outputDirectory);
    if (!outputDir.existsSync()) {
      outputDir.createSync(recursive: true);
    }

    for (final language in TranslationLanguage.values) {
      final file = File(
        path.join(
          outputDir.path,
          '${arbFilePrefix}_${language.languageCode}.arb',
        ),
      );

      final content = _generateArbContent(translations, language);
      file.writeAsStringSync(content);
      // ignore: avoid_print
      print('✅ Generated: ${file.path}');
    }
  }

  void _validateTranslations(List<TranslationLine> translations) {
    bool isListValid = true;
    for (final line in translations) {
      for (final language in TranslationLanguage.values) {
        if (!line.translations.containsKey(language)) {
          // ignore: avoid_print
          print(
            '❌ Missing translation for key "${line.key}" in ${language.name}',
          );
          isListValid = false;
        }
      }
    }
    if (!isListValid) {
      throw Exception('One or more TranslationLine are invalides');
    }
  }

  String _generateArbContent(
    List<TranslationLine> translations,
    TranslationLanguage language,
  ) {
    final arbMap = <String, dynamic>{'@@locale': language.languageCode};

    // Add all translations to the map
    for (final line in translations) {
      arbMap.addAll(line.toArbMap(language));
    }

    return const JsonEncoder.withIndent('  ').convert(arbMap);
  }
}

import 'package:arb_translation/arb_translation.dart';

// TO REGENERATE TRANSLATION
// dart run arb_translation:translations; flutter pub get

void main() {
  final translations = [
    TranslationBuilder.create().key('updateLanguage').text().addTranslations({
      TranslationLanguage.french: "Changer la langue",
      TranslationLanguage.english: "Change language",
    }).build(),

    TranslationBuilder.create().key('selectedLanguage').text().addTranslations({
      TranslationLanguage.french: "Langue",
      TranslationLanguage.english: "language",
    }).build(),

    TranslationBuilder.create().key('selectNewLanguage').text().addTranslations(
      {
        TranslationLanguage.french: "Sélectionnez une langue",
        TranslationLanguage.english: "Select a language",
      },
    ).build(),
  ];
  ArbFileGenerator().generate(translations);
}

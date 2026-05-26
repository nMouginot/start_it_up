import 'dart:ui';

import 'package:arb_translation/arb_translation.dart';

extension TranslationLanguageExt on TranslationLanguage {
  Locale get toLocale => Locale(languageCode, regionalCode);
}

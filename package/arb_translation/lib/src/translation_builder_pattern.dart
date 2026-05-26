import 'models/translation_line.dart';

/// At the end of your translation file you need to add the execution command :
///
/// -> ArbFileGenerator().generate();
///
/// After that you can run the file manualy or run :
///
/// -> dart run arb_translation:translations;flutter pub get
class TranslationBuilder {
  TranslationBuilder._();

  static TranslationKeyStep create() => TranslationKeyStep._();
}

/// CLASS : Name of the method you will call to use this translation key
class TranslationKeyStep {
  TranslationKeyStep._();

  /// Name of the method you will call to use this translation key
  TranslationTypeStep key(String key) {
    return TranslationTypeStep._(key);
  }
}

class TranslationTypeStep {
  final String _key;

  TranslationTypeStep._(this._key);

  /// Implement a simple text translations
  TextTranslationStep text() {
    return TextTranslationStep._(_key);
  }

  /// Implement a translation that need modification with plurals
  PluralTranslationStep plural(String variable) {
    return PluralTranslationStep._(_key, variable);
  }

  /// Implement a translation based on an enum
  SelectTranslationStep select(String variable) {
    return SelectTranslationStep._(_key, variable);
  }
}

class TextTranslationStep {
  final String _key;
  final Map<TranslationLanguage, TextTranslation> _translations = {};
  String? _description;
  final Map<String, PlaceholderInfo> _placeholders = {};

  TextTranslationStep._(this._key);

  /// Implement translation for one language
  TextTranslationStep addTranslation(
    TranslationLanguage language,
    String text,
  ) {
    if (_translations.containsKey(language)) {
      throw StateError(
        'Translation for ${language.languageCode} already exists',
      );
    }
    _translations[language] = TextTranslation.text(text);
    return this;
  }

  /// Implement translation for multiples languages with one method
  TextTranslationStep addTranslations(
    Map<TranslationLanguage, String> translations,
  ) {
    for (final entry in translations.entries) {
      if (_translations.containsKey(entry.key)) {
        throw StateError(
          'Translation for ${entry.key.languageCode} already exists',
        );
      }
      _translations[entry.key] = TextTranslation.text(entry.value);
    }
    return this;
  }

  /// Describe what the translated sentence mean
  TextTranslationStep description(String description) {
    _description = description;
    return this;
  }

  /// Define a new typed dynamic variable that can be used in the translation
  TextTranslationStep addPlaceholder(String name, PlaceholderInfo info) {
    if (_placeholders.containsKey(name)) {
      throw StateError('Placeholder "$name" already exists');
    }
    _placeholders[name] = info;
    return this;
  }

  /// END OF THE BUILDER - Create the translation
  TranslationLine build() {
    if (_translations.isEmpty) {
      throw StateError('At least one translation is required');
    }

    return TranslationLine(
      key: _key,
      translations: _translations,
      description: _description,
      placeholders: _placeholders.isEmpty ? null : _placeholders,
    );
  }
}

class PluralTranslationStep {
  final String _key;
  final String _variable;
  final Map<TranslationLanguage, _PluralForms> _translations = {};
  String? _description;
  final Map<String, PlaceholderInfo> _placeholders = {};

  PluralTranslationStep._(this._key, this._variable);

  /// Start defining plural forms for a language
  PluralFormsStep forLanguage(TranslationLanguage language) {
    if (_translations.containsKey(language)) {
      throw StateError(
        'Translation for ${language.languageCode} already exists',
      );
    }
    return PluralFormsStep._(this, language);
  }

  /// Describe what the translated sentence mean
  PluralTranslationStep description(String description) {
    _description = description;
    return this;
  }

  /// Define a new typed dynamic variable that can be used in the translation
  PluralTranslationStep addPlaceholder(String name, PlaceholderInfo info) {
    if (_placeholders.containsKey(name)) {
      throw StateError('Placeholder "$name" already exists');
    }
    _placeholders[name] = info;
    return this;
  }

  /// END OF THE BUILDER - Create the translation
  TranslationLine build() {
    if (_translations.isEmpty) {
      throw StateError('At least one translation is required');
    }

    // Ensure the plural variable is defined as a placeholder
    if (!_placeholders.containsKey(_variable)) {
      _placeholders[_variable] = PlaceholderInfo(type: TypeEnum.num);
    }

    return TranslationLine(
      key: _key,
      translations: _translations.map(
        (lang, forms) => MapEntry(
          lang,
          TextTranslation.plural(
            pluralVariableName: _variable,
            zero: forms.zero,
            one: forms.one,
            other: forms.other,
          ),
        ),
      ),
      description: _description,
      placeholders: _placeholders,
    );
  }
}

/// Helper class to build plural forms for a specific language
class PluralFormsStep {
  final PluralTranslationStep _parent;
  final TranslationLanguage _language;
  final _PluralForms _forms = _PluralForms();

  PluralFormsStep._(this._parent, this._language);

  /// Translation in case of 0 elements existing
  PluralFormsStep zero(String text) {
    _forms.zero = text;
    return this;
  }

  /// Translation in case of 1 elements existing
  PluralFormsStep one(String text) {
    _forms.one = text;
    return this;
  }

  /// Translation in all others cases
  PluralTranslationStep other(String text) {
    _forms.other = text;
    _parent._translations[_language] = _forms;
    return _parent;
  }
}

class _PluralForms {
  String? zero;
  String? one;
  late String other;
}

class SelectTranslationStep {
  final String _key;
  final String _variable;
  final Map<TranslationLanguage, _SelectCases> _translations = {};
  String? _description;
  final Map<String, PlaceholderInfo> _placeholders = {};

  SelectTranslationStep._(this._key, this._variable);

  /// Start defining select cases for a language
  SelectCasesStep forLanguage(TranslationLanguage language) {
    if (_translations.containsKey(language)) {
      throw StateError(
        'Translation for ${language.languageCode} already exists',
      );
    }
    return SelectCasesStep._(this, language);
  }

  /// Describe what the translated sentence mean
  SelectTranslationStep description(String description) {
    _description = description;
    return this;
  }

  /// Define a new typed dynamic variable that can be used in the translation
  SelectTranslationStep addPlaceholder(
    String name,
    PlaceholderInfo placeholder,
  ) {
    if (_placeholders.containsKey(name)) {
      throw StateError('Placeholder "$name" already exists');
    }
    _placeholders[name] = placeholder;
    return this;
  }

  /// END OF THE BUILDER - Create the translation
  TranslationLine build() {
    if (_translations.isEmpty) {
      throw StateError('At least one translation is required');
    }

    // Ensure the select variable is defined as a placeholder
    if (!_placeholders.containsKey(_variable)) {
      _placeholders[_variable] = PlaceholderInfo(type: TypeEnum.string);
    }

    return TranslationLine(
      key: _key,
      translations: _translations.map(
        (lang, cases) => MapEntry(
          lang,
          TextTranslation.select(
            selectVariableName: _variable,
            cases: cases.cases,
            selectOther: cases.other,
          ),
        ),
      ),
      description: _description,
      placeholders: _placeholders,
    );
  }
}

/// Helper class to build select cases for a specific language
class SelectCasesStep {
  final SelectTranslationStep _parent;
  final TranslationLanguage _language;
  final _SelectCases _cases = _SelectCases();

  SelectCasesStep._(this._parent, this._language);

  SelectCasesStep addCase(String caseValue, String text) {
    if (_cases.cases.containsKey(caseValue)) {
      throw StateError('Case "$caseValue" already exists for ${_parent._key}');
    }
    _cases.cases[caseValue] = text;
    return this;
  }

  /// Required: the fallback case
  SelectTranslationStep other(String text) {
    _cases.other = text;
    _parent._translations[_language] = _cases;
    return _parent;
  }
}

class _SelectCases {
  final Map<String, String> cases = {};
  late String other;
}

class TextTranslation {
  final String text;

  final String? pluralVariableName;
  final String? zero;
  final String? one;
  final String? pluralOther;

  final String? selectVariableName;
  final Map<String, String>? cases;
  final String? selectOther;

  TextTranslation._({
    required this.text,

    this.pluralVariableName,
    this.zero,
    this.one,
    this.pluralOther,
    this.selectVariableName,
    this.cases,
    this.selectOther,
  });

  factory TextTranslation.text(String text) {
    return TextTranslation._(text: text);
  }

  factory TextTranslation.plural({
    required String pluralVariableName,
    String? zero,
    String? one,
    required String other,
  }) {
    return TextTranslation._(
      text: '',
      pluralVariableName: pluralVariableName,
      zero: zero,
      one: one,
      pluralOther: other,
    );
  }

  factory TextTranslation.select({
    required String selectVariableName,
    required Map<String, String> cases,
    required String selectOther,
  }) {
    return TextTranslation._(
      text: '',
      cases: cases,
      selectOther: selectOther,
      selectVariableName: selectVariableName,
    );
  }

  String toArbString() {
    if (pluralVariableName?.isNotEmpty == true) {
      final parts = <String>[];

      if (zero != null) parts.add('=0{$zero}');
      if (one != null) parts.add('=1{$one}');
      parts.add('other{$pluralOther}');

      return '{$pluralVariableName, plural, ${parts.join(' ')}}';
    } else if (selectVariableName?.isNotEmpty == true &&
        cases?.isNotEmpty == true) {
      final parts = cases!.entries.map((e) => '${e.key}{${e.value}}').toList();
      parts.add('other{$selectOther}');

      return '{$selectVariableName, select, ${parts.join(' ')}}';
    } else {
      return text;
    }
  }
}

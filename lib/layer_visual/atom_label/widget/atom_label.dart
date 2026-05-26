import 'package:flutter/material.dart';

import '../../../layer_technical/extension/string_extension.dart';

enum TextCaseEnum { none, upperCase, lowerCase, capitalizeFirst }

typedef TextStyleBuilder = TextStyle Function(BuildContext context);

class AtomLabel extends StatelessWidget {
  final String text;
  final int maxLines;
  final Color? textColor;
  final TextAlign textAlign;
  final TextCaseEnum textCase;
  final TextStyleBuilder textStyle;

  const AtomLabel._({
    this.textColor,
    this.maxLines = 1,
    required this.text,
    required this.textCase,
    required this.textAlign,
    required this.textStyle,
  });

  factory AtomLabel.title({
    required String text,
    Color? textColor,
    int maxLines = 1,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .upperCase,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
  );

  factory AtomLabel.largeBold({
    required String text,
    int maxLines = 1,
    Color? textColor,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .capitalizeFirst,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(
      context,
    ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
  );

  factory AtomLabel.large({
    required String text,
    int maxLines = 1,
    Color? textColor,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .capitalizeFirst,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(context).textTheme.bodyLarge!,
  );

  factory AtomLabel.mediumBold({
    required String text,
    int maxLines = 1,
    Color? textColor,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .capitalizeFirst,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(
      context,
    ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
  );

  factory AtomLabel.medium({
    required String text,
    int maxLines = 1,
    Color? textColor,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .capitalizeFirst,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(context).textTheme.bodyMedium!,
  );

  factory AtomLabel.small({
    required String text,
    int maxLines = 1,
    Color? textColor,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .capitalizeFirst,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(context).textTheme.bodySmall!,
  );

  factory AtomLabel.smallBold({
    required String text,
    int maxLines = 1,
    Color? textColor,
    TextAlign textAlign = .start,
    TextCaseEnum textCase = .capitalizeFirst,
  }) => AtomLabel._(
    text: text,
    maxLines: maxLines,
    textCase: textCase,
    textAlign: textAlign,
    textColor: textColor,
    textStyle: (context) => Theme.of(
      context,
    ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
  );

  String _textDisplayed() => switch (textCase) {
    .capitalizeFirst => text.capitalizeFirst,
    .upperCase => text.toUpperCase(),
    .lowerCase => text.toLowerCase(),
    .none => text,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            _textDisplayed(),
            maxLines: maxLines,
            textAlign: textAlign,
            overflow: .ellipsis,
          ),
        ),
      ],
    );
  }
}

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'theme_color_parser.dart';

part 'slide_theme_colors.g.dart';

@CopyWith()
@JsonSerializable()
class SlideThemeColors {
  final String background;
  final String surface;
  final String primary;
  final String accent;
  final String text;

  const SlideThemeColors({
    required this.background,
    required this.surface,
    required this.primary,
    required this.accent,
    required this.text,
  });

  const SlideThemeColors.defaults()
    : background = '#FFFFFF',
      surface = '#F5F5F5',
      primary = '#000000',
      accent = '#DC2626',
      text = '#111111';

  Color get backgroundColor => parseThemeHex(background);
  Color get surfaceColor => parseThemeHex(surface);
  Color get primaryColor => parseThemeHex(primary);
  Color get accentColor => parseThemeHex(accent);
  Color get textColor => parseThemeHex(text);

  factory SlideThemeColors.fromJson(Map<String, dynamic> json) =>
      _$SlideThemeColorsFromJson(json);

  Map<String, dynamic> toJson() => _$SlideThemeColorsToJson(this);
}

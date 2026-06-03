import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

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

  Color get backgroundColor => _parseHex(background);
  Color get surfaceColor => _parseHex(surface);
  Color get primaryColor => _parseHex(primary);
  Color get accentColor => _parseHex(accent);
  Color get textColor => _parseHex(text);

  static Color _parseHex(String hex) {
    final cleaned = hex.replaceFirst('#', '').padLeft(6, '0');
    final value = int.parse(cleaned, radix: 16);
    return Color(0xFF000000 | value);
  }

  factory SlideThemeColors.fromJson(Map<String, dynamic> json) =>
      _$SlideThemeColorsFromJson(json);

  Map<String, dynamic> toJson() => _$SlideThemeColorsToJson(this);
}

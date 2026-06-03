import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_annotation/json_annotation.dart';

import 'slide_theme_assets.dart';
import 'slide_theme_colors.dart';
import 'slide_theme_typography.dart';

part 'slide_theme.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class SlideTheme {
  final SlideThemeColors colors;
  final SlideThemeTypography typography;
  final SlideThemeAssets assets;

  const SlideTheme({
    required this.colors,
    required this.typography,
    required this.assets,
  });

  const SlideTheme.defaults()
    : colors = const SlideThemeColors.defaults(),
      typography = const SlideThemeTypography.defaults(),
      assets = const SlideThemeAssets.defaults();

  TextStyle _font({
    required double size,
    FontWeight weight = FontWeight.w400,
    Color? color,
  }) {
    try {
      return GoogleFonts.getFont(
        typography.fontFamily,
        fontSize: size,
        fontWeight: weight,
        color: color ?? colors.textColor,
      );
    } catch (_) {
      return TextStyle(
        fontFamily: typography.fontFamily,
        fontSize: size,
        fontWeight: weight,
        color: color ?? colors.textColor,
      );
    }
  }

  TextStyle display({Color? color}) => _font(
    size: typography.displaySize,
    weight: FontWeight.w700,
    color: color,
  );

  TextStyle headline({Color? color}) => _font(
    size: typography.headlineSize,
    weight: FontWeight.w600,
    color: color,
  );

  TextStyle title({Color? color}) =>
      _font(size: typography.titleSize, weight: FontWeight.w600, color: color);

  TextStyle body({Color? color}) =>
      _font(size: typography.bodySize, color: color);

  factory SlideTheme.fromJson(Map<String, dynamic> json) =>
      _$SlideThemeFromJson(json);

  Map<String, dynamic> toJson() => _$SlideThemeToJson(this);
}

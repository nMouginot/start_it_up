import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slide_theme_typography.g.dart';

@CopyWith()
@JsonSerializable()
class SlideThemeTypography {
  final String fontFamily;
  final double displaySize;
  final double headlineSize;
  final double titleSize;
  final double bodySize;

  const SlideThemeTypography({
    required this.fontFamily,
    required this.displaySize,
    required this.headlineSize,
    required this.titleSize,
    required this.bodySize,
  });

  const SlideThemeTypography.defaults()
    : fontFamily = 'Inter',
      displaySize = 56,
      headlineSize = 32,
      titleSize = 20,
      bodySize = 16;

  factory SlideThemeTypography.fromJson(Map<String, dynamic> json) =>
      _$SlideThemeTypographyFromJson(json);

  Map<String, dynamic> toJson() => _$SlideThemeTypographyToJson(this);
}

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slide_theme_assets.g.dart';

@CopyWith()
@JsonSerializable()
class SlideThemeAssets {
  final String? logoUrl;
  final String? backgroundImageUrl;

  const SlideThemeAssets({this.logoUrl, this.backgroundImageUrl});

  const SlideThemeAssets.defaults()
    : logoUrl = 'assets/logo.png',
      backgroundImageUrl = 'assets/background.png';

  factory SlideThemeAssets.fromJson(Map<String, dynamic> json) =>
      _$SlideThemeAssetsFromJson(json);

  Map<String, dynamic> toJson() => _$SlideThemeAssetsToJson(this);
}

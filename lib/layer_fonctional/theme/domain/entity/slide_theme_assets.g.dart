// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_theme_assets.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideThemeAssetsCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeAssets(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeAssets call({String? logoUrl, String? backgroundImageUrl});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideThemeAssets.copyWith(...)`.
class _$SlideThemeAssetsCWProxyImpl implements _$SlideThemeAssetsCWProxy {
  const _$SlideThemeAssetsCWProxyImpl(this._value);

  final SlideThemeAssets _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeAssets(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeAssets call({
    Object? logoUrl = const $CopyWithPlaceholder(),
    Object? backgroundImageUrl = const $CopyWithPlaceholder(),
  }) {
    return SlideThemeAssets(
      logoUrl: logoUrl == const $CopyWithPlaceholder()
          ? _value.logoUrl
          // ignore: cast_nullable_to_non_nullable
          : logoUrl as String?,
      backgroundImageUrl: backgroundImageUrl == const $CopyWithPlaceholder()
          ? _value.backgroundImageUrl
          // ignore: cast_nullable_to_non_nullable
          : backgroundImageUrl as String?,
    );
  }
}

extension $SlideThemeAssetsCopyWith on SlideThemeAssets {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideThemeAssets.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideThemeAssetsCWProxy get copyWith => _$SlideThemeAssetsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideThemeAssets _$SlideThemeAssetsFromJson(Map<String, dynamic> json) =>
    SlideThemeAssets(
      logoUrl: json['logoUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
    );

Map<String, dynamic> _$SlideThemeAssetsToJson(SlideThemeAssets instance) =>
    <String, dynamic>{
      'logoUrl': instance.logoUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
    };

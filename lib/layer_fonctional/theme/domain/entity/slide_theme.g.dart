// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_theme.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideThemeCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideTheme(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideTheme call({
    SlideThemeColors colors,
    SlideThemeTypography typography,
    SlideThemeAssets assets,
    SlideThemeStatus status,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideTheme.copyWith(...)`.
class _$SlideThemeCWProxyImpl implements _$SlideThemeCWProxy {
  const _$SlideThemeCWProxyImpl(this._value);

  final SlideTheme _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideTheme(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideTheme call({
    Object? colors = const $CopyWithPlaceholder(),
    Object? typography = const $CopyWithPlaceholder(),
    Object? assets = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return SlideTheme(
      colors: colors == const $CopyWithPlaceholder() || colors == null
          ? _value.colors
          // ignore: cast_nullable_to_non_nullable
          : colors as SlideThemeColors,
      typography:
          typography == const $CopyWithPlaceholder() || typography == null
          ? _value.typography
          // ignore: cast_nullable_to_non_nullable
          : typography as SlideThemeTypography,
      assets: assets == const $CopyWithPlaceholder() || assets == null
          ? _value.assets
          // ignore: cast_nullable_to_non_nullable
          : assets as SlideThemeAssets,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as SlideThemeStatus,
    );
  }
}

extension $SlideThemeCopyWith on SlideTheme {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideTheme.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideThemeCWProxy get copyWith => _$SlideThemeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideTheme _$SlideThemeFromJson(Map<String, dynamic> json) => SlideTheme(
  colors: SlideThemeColors.fromJson(json['colors'] as Map<String, dynamic>),
  typography: SlideThemeTypography.fromJson(
    json['typography'] as Map<String, dynamic>,
  ),
  assets: SlideThemeAssets.fromJson(json['assets'] as Map<String, dynamic>),
  status: SlideThemeStatus.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SlideThemeToJson(SlideTheme instance) =>
    <String, dynamic>{
      'colors': instance.colors.toJson(),
      'typography': instance.typography.toJson(),
      'assets': instance.assets.toJson(),
      'status': instance.status.toJson(),
    };

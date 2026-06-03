// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_theme_colors.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideThemeColorsCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeColors(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeColors call({
    String background,
    String surface,
    String primary,
    String accent,
    String text,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideThemeColors.copyWith(...)`.
class _$SlideThemeColorsCWProxyImpl implements _$SlideThemeColorsCWProxy {
  const _$SlideThemeColorsCWProxyImpl(this._value);

  final SlideThemeColors _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeColors(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeColors call({
    Object? background = const $CopyWithPlaceholder(),
    Object? surface = const $CopyWithPlaceholder(),
    Object? primary = const $CopyWithPlaceholder(),
    Object? accent = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return SlideThemeColors(
      background:
          background == const $CopyWithPlaceholder() || background == null
          ? _value.background
          // ignore: cast_nullable_to_non_nullable
          : background as String,
      surface: surface == const $CopyWithPlaceholder() || surface == null
          ? _value.surface
          // ignore: cast_nullable_to_non_nullable
          : surface as String,
      primary: primary == const $CopyWithPlaceholder() || primary == null
          ? _value.primary
          // ignore: cast_nullable_to_non_nullable
          : primary as String,
      accent: accent == const $CopyWithPlaceholder() || accent == null
          ? _value.accent
          // ignore: cast_nullable_to_non_nullable
          : accent as String,
      text: text == const $CopyWithPlaceholder() || text == null
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
    );
  }
}

extension $SlideThemeColorsCopyWith on SlideThemeColors {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideThemeColors.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideThemeColorsCWProxy get copyWith => _$SlideThemeColorsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideThemeColors _$SlideThemeColorsFromJson(Map<String, dynamic> json) =>
    SlideThemeColors(
      background: json['background'] as String,
      surface: json['surface'] as String,
      primary: json['primary'] as String,
      accent: json['accent'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$SlideThemeColorsToJson(SlideThemeColors instance) =>
    <String, dynamic>{
      'background': instance.background,
      'surface': instance.surface,
      'primary': instance.primary,
      'accent': instance.accent,
      'text': instance.text,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_theme_typography.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideThemeTypographyCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeTypography(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeTypography call({
    String fontFamily,
    double displaySize,
    double headlineSize,
    double titleSize,
    double bodySize,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideThemeTypography.copyWith(...)`.
class _$SlideThemeTypographyCWProxyImpl
    implements _$SlideThemeTypographyCWProxy {
  const _$SlideThemeTypographyCWProxyImpl(this._value);

  final SlideThemeTypography _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeTypography(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeTypography call({
    Object? fontFamily = const $CopyWithPlaceholder(),
    Object? displaySize = const $CopyWithPlaceholder(),
    Object? headlineSize = const $CopyWithPlaceholder(),
    Object? titleSize = const $CopyWithPlaceholder(),
    Object? bodySize = const $CopyWithPlaceholder(),
  }) {
    return SlideThemeTypography(
      fontFamily:
          fontFamily == const $CopyWithPlaceholder() || fontFamily == null
          ? _value.fontFamily
          // ignore: cast_nullable_to_non_nullable
          : fontFamily as String,
      displaySize:
          displaySize == const $CopyWithPlaceholder() || displaySize == null
          ? _value.displaySize
          // ignore: cast_nullable_to_non_nullable
          : displaySize as double,
      headlineSize:
          headlineSize == const $CopyWithPlaceholder() || headlineSize == null
          ? _value.headlineSize
          // ignore: cast_nullable_to_non_nullable
          : headlineSize as double,
      titleSize: titleSize == const $CopyWithPlaceholder() || titleSize == null
          ? _value.titleSize
          // ignore: cast_nullable_to_non_nullable
          : titleSize as double,
      bodySize: bodySize == const $CopyWithPlaceholder() || bodySize == null
          ? _value.bodySize
          // ignore: cast_nullable_to_non_nullable
          : bodySize as double,
    );
  }
}

extension $SlideThemeTypographyCopyWith on SlideThemeTypography {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideThemeTypography.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideThemeTypographyCWProxy get copyWith =>
      _$SlideThemeTypographyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideThemeTypography _$SlideThemeTypographyFromJson(
  Map<String, dynamic> json,
) => SlideThemeTypography(
  fontFamily: json['fontFamily'] as String,
  displaySize: (json['displaySize'] as num).toDouble(),
  headlineSize: (json['headlineSize'] as num).toDouble(),
  titleSize: (json['titleSize'] as num).toDouble(),
  bodySize: (json['bodySize'] as num).toDouble(),
);

Map<String, dynamic> _$SlideThemeTypographyToJson(
  SlideThemeTypography instance,
) => <String, dynamic>{
  'fontFamily': instance.fontFamily,
  'displaySize': instance.displaySize,
  'headlineSize': instance.headlineSize,
  'titleSize': instance.titleSize,
  'bodySize': instance.bodySize,
};

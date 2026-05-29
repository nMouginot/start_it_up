// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_timeframe.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideTimeframeCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideTimeframe(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideTimeframe call({DateTime start, DateTime end});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideTimeframe.copyWith(...)`.
class _$SlideTimeframeCWProxyImpl implements _$SlideTimeframeCWProxy {
  const _$SlideTimeframeCWProxyImpl(this._value);

  final SlideTimeframe _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideTimeframe(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideTimeframe call({
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
  }) {
    return SlideTimeframe(
      start: start == const $CopyWithPlaceholder() || start == null
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime,
      end: end == const $CopyWithPlaceholder() || end == null
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as DateTime,
    );
  }
}

extension $SlideTimeframeCopyWith on SlideTimeframe {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideTimeframe.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideTimeframeCWProxy get copyWith => _$SlideTimeframeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideTimeframe _$SlideTimeframeFromJson(Map<String, dynamic> json) =>
    SlideTimeframe(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$SlideTimeframeToJson(SlideTimeframe instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };

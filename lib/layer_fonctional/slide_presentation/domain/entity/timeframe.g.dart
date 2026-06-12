// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'timeframe.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TimeframeCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Timeframe(...).copyWith(id: 12, name: "My name")
  /// ```
  Timeframe call({DateTime start, DateTime end});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTimeframe.copyWith(...)`.
class _$TimeframeCWProxyImpl implements _$TimeframeCWProxy {
  const _$TimeframeCWProxyImpl(this._value);

  final Timeframe _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Timeframe(...).copyWith(id: 12, name: "My name")
  /// ```
  Timeframe call({
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
  }) {
    return Timeframe(
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

extension $TimeframeCopyWith on Timeframe {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTimeframe.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeframeCWProxy get copyWith => _$TimeframeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeframe _$TimeframeFromJson(Map<String, dynamic> json) => Timeframe(
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
);

Map<String, dynamic> _$TimeframeToJson(Timeframe instance) => <String, dynamic>{
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
};

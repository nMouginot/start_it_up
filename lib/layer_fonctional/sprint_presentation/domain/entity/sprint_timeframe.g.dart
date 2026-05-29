// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'sprint_timeframe.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SprintTimeframeCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SprintTimeframe(...).copyWith(id: 12, name: "My name")
  /// ```
  SprintTimeframe call({DateTime start, DateTime end});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSprintTimeframe.copyWith(...)`.
class _$SprintTimeframeCWProxyImpl implements _$SprintTimeframeCWProxy {
  const _$SprintTimeframeCWProxyImpl(this._value);

  final SprintTimeframe _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SprintTimeframe(...).copyWith(id: 12, name: "My name")
  /// ```
  SprintTimeframe call({
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
  }) {
    return SprintTimeframe(
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

extension $SprintTimeframeCopyWith on SprintTimeframe {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSprintTimeframe.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SprintTimeframeCWProxy get copyWith => _$SprintTimeframeCWProxyImpl(this);
}

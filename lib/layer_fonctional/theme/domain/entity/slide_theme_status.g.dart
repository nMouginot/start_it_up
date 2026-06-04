// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_theme_status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideThemeStatusCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeStatus call({
    String todo,
    String done,
    String failed,
    String blocked,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideThemeStatus.copyWith(...)`.
class _$SlideThemeStatusCWProxyImpl implements _$SlideThemeStatusCWProxy {
  const _$SlideThemeStatusCWProxyImpl(this._value);

  final SlideThemeStatus _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideThemeStatus(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideThemeStatus call({
    Object? todo = const $CopyWithPlaceholder(),
    Object? done = const $CopyWithPlaceholder(),
    Object? failed = const $CopyWithPlaceholder(),
    Object? blocked = const $CopyWithPlaceholder(),
  }) {
    return SlideThemeStatus(
      todo: todo == const $CopyWithPlaceholder() || todo == null
          ? _value.todo
          // ignore: cast_nullable_to_non_nullable
          : todo as String,
      done: done == const $CopyWithPlaceholder() || done == null
          ? _value.done
          // ignore: cast_nullable_to_non_nullable
          : done as String,
      failed: failed == const $CopyWithPlaceholder() || failed == null
          ? _value.failed
          // ignore: cast_nullable_to_non_nullable
          : failed as String,
      blocked: blocked == const $CopyWithPlaceholder() || blocked == null
          ? _value.blocked
          // ignore: cast_nullable_to_non_nullable
          : blocked as String,
    );
  }
}

extension $SlideThemeStatusCopyWith on SlideThemeStatus {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideThemeStatus.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideThemeStatusCWProxy get copyWith => _$SlideThemeStatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideThemeStatus _$SlideThemeStatusFromJson(Map<String, dynamic> json) =>
    SlideThemeStatus(
      todo: json['todo'] as String,
      done: json['done'] as String,
      failed: json['failed'] as String,
      blocked: json['blocked'] as String,
    );

Map<String, dynamic> _$SlideThemeStatusToJson(SlideThemeStatus instance) =>
    <String, dynamic>{
      'todo': instance.todo,
      'done': instance.done,
      'failed': instance.failed,
      'blocked': instance.blocked,
    };

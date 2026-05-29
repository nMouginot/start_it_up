// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project_form_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProjectFormStateCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ProjectFormState(...).copyWith(id: 12, name: "My name")
  /// ```
  ProjectFormState call({
    Project? existing,
    String name,
    String version,
    bool submitting,
    bool submitted,
    Object? error,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfProjectFormState.copyWith(...)`.
class _$ProjectFormStateCWProxyImpl implements _$ProjectFormStateCWProxy {
  const _$ProjectFormStateCWProxyImpl(this._value);

  final ProjectFormState _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ProjectFormState(...).copyWith(id: 12, name: "My name")
  /// ```
  ProjectFormState call({
    Object? existing = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? submitting = const $CopyWithPlaceholder(),
    Object? submitted = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ProjectFormState(
      existing: existing == const $CopyWithPlaceholder()
          ? _value.existing
          // ignore: cast_nullable_to_non_nullable
          : existing as Project?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      version: version == const $CopyWithPlaceholder() || version == null
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String,
      submitting:
          submitting == const $CopyWithPlaceholder() || submitting == null
          ? _value.submitting
          // ignore: cast_nullable_to_non_nullable
          : submitting as bool,
      submitted: submitted == const $CopyWithPlaceholder() || submitted == null
          ? _value.submitted
          // ignore: cast_nullable_to_non_nullable
          : submitted as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Object?,
    );
  }
}

extension $ProjectFormStateCopyWith on ProjectFormState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfProjectFormState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjectFormStateCWProxy get copyWith => _$ProjectFormStateCWProxyImpl(this);
}

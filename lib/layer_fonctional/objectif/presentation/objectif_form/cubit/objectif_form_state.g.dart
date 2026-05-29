// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'objectif_form_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ObjectifFormStateCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ObjectifFormState(...).copyWith(id: 12, name: "My name")
  /// ```
  ObjectifFormState call({
    bool projectsLoading,
    List<Project> availableProjects,
    Objectif? existing,
    int? selectedProjectId,
    String title,
    String description,
    DateTime deadline,
    bool submitting,
    bool submitted,
    Object? error,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfObjectifFormState.copyWith(...)`.
class _$ObjectifFormStateCWProxyImpl implements _$ObjectifFormStateCWProxy {
  const _$ObjectifFormStateCWProxyImpl(this._value);

  final ObjectifFormState _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ObjectifFormState(...).copyWith(id: 12, name: "My name")
  /// ```
  ObjectifFormState call({
    Object? projectsLoading = const $CopyWithPlaceholder(),
    Object? availableProjects = const $CopyWithPlaceholder(),
    Object? existing = const $CopyWithPlaceholder(),
    Object? selectedProjectId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? deadline = const $CopyWithPlaceholder(),
    Object? submitting = const $CopyWithPlaceholder(),
    Object? submitted = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ObjectifFormState(
      projectsLoading:
          projectsLoading == const $CopyWithPlaceholder() ||
              projectsLoading == null
          ? _value.projectsLoading
          // ignore: cast_nullable_to_non_nullable
          : projectsLoading as bool,
      availableProjects:
          availableProjects == const $CopyWithPlaceholder() ||
              availableProjects == null
          ? _value.availableProjects
          // ignore: cast_nullable_to_non_nullable
          : availableProjects as List<Project>,
      existing: existing == const $CopyWithPlaceholder()
          ? _value.existing
          // ignore: cast_nullable_to_non_nullable
          : existing as Objectif?,
      selectedProjectId: selectedProjectId == const $CopyWithPlaceholder()
          ? _value.selectedProjectId
          // ignore: cast_nullable_to_non_nullable
          : selectedProjectId as int?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      deadline: deadline == const $CopyWithPlaceholder() || deadline == null
          ? _value.deadline
          // ignore: cast_nullable_to_non_nullable
          : deadline as DateTime,
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

extension $ObjectifFormStateCopyWith on ObjectifFormState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfObjectifFormState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ObjectifFormStateCWProxy get copyWith =>
      _$ObjectifFormStateCWProxyImpl(this);
}

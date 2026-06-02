// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_setup_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SlideSetupStateCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideSetupState(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideSetupState call({
    bool projectsLoading,
    List<Project> projects,
    List<Objectif> listSelectedObjectif,
    Timeframe timeframe,
    bool building,
    SlidePresentation? builtPresentation,
    Object? error,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSlideSetupState.copyWith(...)`.
class _$SlideSetupStateCWProxyImpl implements _$SlideSetupStateCWProxy {
  const _$SlideSetupStateCWProxyImpl(this._value);

  final SlideSetupState _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SlideSetupState(...).copyWith(id: 12, name: "My name")
  /// ```
  SlideSetupState call({
    Object? projectsLoading = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
    Object? listSelectedObjectif = const $CopyWithPlaceholder(),
    Object? timeframe = const $CopyWithPlaceholder(),
    Object? building = const $CopyWithPlaceholder(),
    Object? builtPresentation = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SlideSetupState(
      projectsLoading:
          projectsLoading == const $CopyWithPlaceholder() ||
              projectsLoading == null
          ? _value.projectsLoading
          // ignore: cast_nullable_to_non_nullable
          : projectsLoading as bool,
      projects: projects == const $CopyWithPlaceholder() || projects == null
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<Project>,
      listSelectedObjectif:
          listSelectedObjectif == const $CopyWithPlaceholder() ||
              listSelectedObjectif == null
          ? _value.listSelectedObjectif
          // ignore: cast_nullable_to_non_nullable
          : listSelectedObjectif as List<Objectif>,
      timeframe: timeframe == const $CopyWithPlaceholder() || timeframe == null
          ? _value.timeframe
          // ignore: cast_nullable_to_non_nullable
          : timeframe as Timeframe,
      building: building == const $CopyWithPlaceholder() || building == null
          ? _value.building
          // ignore: cast_nullable_to_non_nullable
          : building as bool,
      builtPresentation: builtPresentation == const $CopyWithPlaceholder()
          ? _value.builtPresentation
          // ignore: cast_nullable_to_non_nullable
          : builtPresentation as SlidePresentation?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Object?,
    );
  }
}

extension $SlideSetupStateCopyWith on SlideSetupState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideSetupState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideSetupStateCWProxy get copyWith => _$SlideSetupStateCWProxyImpl(this);
}

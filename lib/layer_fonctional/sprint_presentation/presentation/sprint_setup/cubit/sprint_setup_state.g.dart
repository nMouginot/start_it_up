// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'sprint_setup_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SprintSetupStateCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SprintSetupState(...).copyWith(id: 12, name: "My name")
  /// ```
  SprintSetupState call({
    bool catalogLoading,
    ProjectCatalog? catalog,
    Set<int> selectedObjectifIds,
    SprintTimeframe timeframe,
    bool building,
    SprintPresentation? builtPresentation,
    Object? error,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSprintSetupState.copyWith(...)`.
class _$SprintSetupStateCWProxyImpl implements _$SprintSetupStateCWProxy {
  const _$SprintSetupStateCWProxyImpl(this._value);

  final SprintSetupState _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// SprintSetupState(...).copyWith(id: 12, name: "My name")
  /// ```
  SprintSetupState call({
    Object? catalogLoading = const $CopyWithPlaceholder(),
    Object? catalog = const $CopyWithPlaceholder(),
    Object? selectedObjectifIds = const $CopyWithPlaceholder(),
    Object? timeframe = const $CopyWithPlaceholder(),
    Object? building = const $CopyWithPlaceholder(),
    Object? builtPresentation = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SprintSetupState(
      catalogLoading:
          catalogLoading == const $CopyWithPlaceholder() ||
              catalogLoading == null
          ? _value.catalogLoading
          // ignore: cast_nullable_to_non_nullable
          : catalogLoading as bool,
      catalog: catalog == const $CopyWithPlaceholder()
          ? _value.catalog
          // ignore: cast_nullable_to_non_nullable
          : catalog as ProjectCatalog?,
      selectedObjectifIds:
          selectedObjectifIds == const $CopyWithPlaceholder() ||
              selectedObjectifIds == null
          ? _value.selectedObjectifIds
          // ignore: cast_nullable_to_non_nullable
          : selectedObjectifIds as Set<int>,
      timeframe: timeframe == const $CopyWithPlaceholder() || timeframe == null
          ? _value.timeframe
          // ignore: cast_nullable_to_non_nullable
          : timeframe as SprintTimeframe,
      building: building == const $CopyWithPlaceholder() || building == null
          ? _value.building
          // ignore: cast_nullable_to_non_nullable
          : building as bool,
      builtPresentation: builtPresentation == const $CopyWithPlaceholder()
          ? _value.builtPresentation
          // ignore: cast_nullable_to_non_nullable
          : builtPresentation as SprintPresentation?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as Object?,
    );
  }
}

extension $SprintSetupStateCopyWith on SprintSetupState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSprintSetupState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SprintSetupStateCWProxy get copyWith => _$SprintSetupStateCWProxyImpl(this);
}

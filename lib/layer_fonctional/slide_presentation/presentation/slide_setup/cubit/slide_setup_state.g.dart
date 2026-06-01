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
    bool catalogLoading,
    ProjectCatalog? catalog,
    List<Objectif> listSelectedObjectif,
    SlideTimeframe timeframe,
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
    Object? catalogLoading = const $CopyWithPlaceholder(),
    Object? catalog = const $CopyWithPlaceholder(),
    Object? listSelectedObjectif = const $CopyWithPlaceholder(),
    Object? timeframe = const $CopyWithPlaceholder(),
    Object? building = const $CopyWithPlaceholder(),
    Object? builtPresentation = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SlideSetupState(
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
      listSelectedObjectif:
          listSelectedObjectif == const $CopyWithPlaceholder() ||
              listSelectedObjectif == null
          ? _value.listSelectedObjectif
          // ignore: cast_nullable_to_non_nullable
          : listSelectedObjectif as List<Objectif>,
      timeframe: timeframe == const $CopyWithPlaceholder() || timeframe == null
          ? _value.timeframe
          // ignore: cast_nullable_to_non_nullable
          : timeframe as SlideTimeframe,
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

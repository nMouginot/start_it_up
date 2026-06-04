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
    bool loading,
    List<Slide> slides,
    List<SlideTemplate> templates,
    Timeframe timeframe,
    SlideTheme theme,
    bool building,
    SlidePresentation? builtPresentation,
    Object? error,
    String exportJson,
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
    Object? loading = const $CopyWithPlaceholder(),
    Object? slides = const $CopyWithPlaceholder(),
    Object? templates = const $CopyWithPlaceholder(),
    Object? timeframe = const $CopyWithPlaceholder(),
    Object? theme = const $CopyWithPlaceholder(),
    Object? building = const $CopyWithPlaceholder(),
    Object? builtPresentation = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? exportJson = const $CopyWithPlaceholder(),
  }) {
    return SlideSetupState(
      loading: loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      slides: slides == const $CopyWithPlaceholder() || slides == null
          ? _value.slides
          // ignore: cast_nullable_to_non_nullable
          : slides as List<Slide>,
      templates: templates == const $CopyWithPlaceholder() || templates == null
          ? _value.templates
          // ignore: cast_nullable_to_non_nullable
          : templates as List<SlideTemplate>,
      timeframe: timeframe == const $CopyWithPlaceholder() || timeframe == null
          ? _value.timeframe
          // ignore: cast_nullable_to_non_nullable
          : timeframe as Timeframe,
      theme: theme == const $CopyWithPlaceholder() || theme == null
          ? _value.theme
          // ignore: cast_nullable_to_non_nullable
          : theme as SlideTheme,
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
      exportJson:
          exportJson == const $CopyWithPlaceholder() || exportJson == null
          ? _value.exportJson
          // ignore: cast_nullable_to_non_nullable
          : exportJson as String,
    );
  }
}

extension $SlideSetupStateCopyWith on SlideSetupState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSlideSetupState.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$SlideSetupStateCWProxy get copyWith => _$SlideSetupStateCWProxyImpl(this);
}

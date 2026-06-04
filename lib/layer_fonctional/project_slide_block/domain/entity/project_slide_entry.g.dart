// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project_slide_entry.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProjectSlideEntryCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ProjectSlideEntry(...).copyWith(id: 12, name: "My name")
  /// ```
  ProjectSlideEntry call({Project project, List<Objectif> objectifs});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfProjectSlideEntry.copyWith(...)`.
class _$ProjectSlideEntryCWProxyImpl implements _$ProjectSlideEntryCWProxy {
  const _$ProjectSlideEntryCWProxyImpl(this._value);

  final ProjectSlideEntry _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ProjectSlideEntry(...).copyWith(id: 12, name: "My name")
  /// ```
  ProjectSlideEntry call({
    Object? project = const $CopyWithPlaceholder(),
    Object? objectifs = const $CopyWithPlaceholder(),
  }) {
    return ProjectSlideEntry(
      project: project == const $CopyWithPlaceholder() || project == null
          ? _value.project
          // ignore: cast_nullable_to_non_nullable
          : project as Project,
      objectifs: objectifs == const $CopyWithPlaceholder() || objectifs == null
          ? _value.objectifs
          // ignore: cast_nullable_to_non_nullable
          : objectifs as List<Objectif>,
    );
  }
}

extension $ProjectSlideEntryCopyWith on ProjectSlideEntry {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfProjectSlideEntry.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjectSlideEntryCWProxy get copyWith =>
      _$ProjectSlideEntryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectSlideEntry _$ProjectSlideEntryFromJson(Map<String, dynamic> json) =>
    ProjectSlideEntry(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      objectifs: (json['objectifs'] as List<dynamic>)
          .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectSlideEntryToJson(ProjectSlideEntry instance) =>
    <String, dynamic>{
      'project': instance.project.toJson(),
      'objectifs': instance.objectifs.map((e) => e.toJson()).toList(),
    };

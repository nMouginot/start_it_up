// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProjectCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Project(...).copyWith(id: 12, name: "My name")
  /// ```
  Project call({
    int id,
    String name,
    Version version,
    List<Objectif> listObjectif,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfProject.copyWith(...)`.
class _$ProjectCWProxyImpl implements _$ProjectCWProxy {
  const _$ProjectCWProxyImpl(this._value);

  final Project _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Project(...).copyWith(id: 12, name: "My name")
  /// ```
  Project call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? listObjectif = const $CopyWithPlaceholder(),
  }) {
    return Project(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      version: version == const $CopyWithPlaceholder() || version == null
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as Version,
      listObjectif:
          listObjectif == const $CopyWithPlaceholder() || listObjectif == null
          ? _value.listObjectif
          // ignore: cast_nullable_to_non_nullable
          : listObjectif as List<Objectif>,
    );
  }
}

extension $ProjectCopyWith on Project {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfProject.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjectCWProxy get copyWith => _$ProjectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  version: Version.fromJson(json['version'] as Map<String, dynamic>),
  listObjectif: (json['listObjectif'] as List<dynamic>)
      .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'version': instance.version.toJson(),
  'listObjectif': instance.listObjectif.map((e) => e.toJson()).toList(),
};

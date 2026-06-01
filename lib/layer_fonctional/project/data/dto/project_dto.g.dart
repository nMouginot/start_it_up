// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProjectDtoCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ProjectDto(...).copyWith(id: 12, name: "My name")
  /// ```
  ProjectDto call({
    int id,
    String name,
    String version,
    List<ObjectifDto> objectifs,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfProjectDto.copyWith(...)`.
class _$ProjectDtoCWProxyImpl implements _$ProjectDtoCWProxy {
  const _$ProjectDtoCWProxyImpl(this._value);

  final ProjectDto _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// ProjectDto(...).copyWith(id: 12, name: "My name")
  /// ```
  ProjectDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? objectifs = const $CopyWithPlaceholder(),
  }) {
    return ProjectDto(
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
          : version as String,
      objectifs: objectifs == const $CopyWithPlaceholder() || objectifs == null
          ? _value.objectifs
          // ignore: cast_nullable_to_non_nullable
          : objectifs as List<ObjectifDto>,
    );
  }
}

extension $ProjectDtoCopyWith on ProjectDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfProjectDto.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjectDtoCWProxy get copyWith => _$ProjectDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  version: json['version'] as String,
  objectifs: (json['objectifs'] as List<dynamic>)
      .map((e) => ObjectifDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'version': instance.version,
      'objectifs': instance.objectifs.map((e) => e.toJson()).toList(),
    };

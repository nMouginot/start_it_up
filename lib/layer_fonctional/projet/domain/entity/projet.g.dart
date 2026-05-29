// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'projet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProjetCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Projet(...).copyWith(id: 12, name: "My name")
  /// ```
  Projet call({int id, String name, String version});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfProjet.copyWith(...)`.
class _$ProjetCWProxyImpl implements _$ProjetCWProxy {
  const _$ProjetCWProxyImpl(this._value);

  final Projet _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Projet(...).copyWith(id: 12, name: "My name")
  /// ```
  Projet call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Projet(
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
    );
  }
}

extension $ProjetCopyWith on Projet {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfProjet.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ProjetCWProxy get copyWith => _$ProjetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projet _$ProjetFromJson(Map<String, dynamic> json) => Projet(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  version: json['version'] as String,
);

Map<String, dynamic> _$ProjetToJson(Projet instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'version': instance.version,
};

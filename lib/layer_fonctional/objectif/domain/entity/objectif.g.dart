// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'objectif.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ObjectifCWProxy {
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Objectif(...).copyWith(id: 12, name: "My name")
  /// ```
  Objectif call({
    int id,
    int projetId,
    String title,
    String description,
    DateTime deadline,
    ObjectifStatus status,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfObjectif.copyWith(...)`.
class _$ObjectifCWProxyImpl implements _$ObjectifCWProxy {
  const _$ObjectifCWProxyImpl(this._value);

  final Objectif _value;

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored.
  ///
  /// Example:
  /// ```dart
  /// Objectif(...).copyWith(id: 12, name: "My name")
  /// ```
  Objectif call({
    Object? id = const $CopyWithPlaceholder(),
    Object? projetId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? deadline = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return Objectif(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      projetId: projetId == const $CopyWithPlaceholder() || projetId == null
          ? _value.projetId
          // ignore: cast_nullable_to_non_nullable
          : projetId as int,
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
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ObjectifStatus,
    );
  }
}

extension $ObjectifCopyWith on Objectif {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfObjectif.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$ObjectifCWProxy get copyWith => _$ObjectifCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Objectif _$ObjectifFromJson(Map<String, dynamic> json) => Objectif(
  id: (json['id'] as num).toInt(),
  projetId: (json['projetId'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  deadline: DateTime.parse(json['deadline'] as String),
  status: $enumDecode(_$ObjectifStatusEnumMap, json['status']),
);

Map<String, dynamic> _$ObjectifToJson(Objectif instance) => <String, dynamic>{
  'id': instance.id,
  'projetId': instance.projetId,
  'title': instance.title,
  'description': instance.description,
  'deadline': instance.deadline.toIso8601String(),
  'status': _$ObjectifStatusEnumMap[instance.status]!,
};

const _$ObjectifStatusEnumMap = {
  ObjectifStatus.todo: 'todo',
  ObjectifStatus.done: 'done',
  ObjectifStatus.failed: 'failed',
  ObjectifStatus.blocked: 'blocked',
};

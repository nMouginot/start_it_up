// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'objectif_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectifDto _$ObjectifDtoFromJson(Map<String, dynamic> json) => ObjectifDto(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  deadline: DateTime.parse(json['deadline'] as String),
  status: $enumDecode(_$ObjectifStatusEnumMap, json['status']),
);

Map<String, dynamic> _$ObjectifDtoToJson(ObjectifDto instance) =>
    <String, dynamic>{
      'id': instance.id,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project_sprint_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectSprintBlock _$ProjectSprintBlockFromJson(Map<String, dynamic> json) =>
    ProjectSprintBlock(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      objectifs: (json['objectifs'] as List<dynamic>)
          .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectSprintBlockToJson(ProjectSprintBlock instance) =>
    <String, dynamic>{
      'project': instance.project.toJson(),
      'objectifs': instance.objectifs.map((e) => e.toJson()).toList(),
    };

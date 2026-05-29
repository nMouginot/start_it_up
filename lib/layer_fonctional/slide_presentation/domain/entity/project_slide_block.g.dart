// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project_slide_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectSlideBlock _$ProjectSlideBlockFromJson(Map<String, dynamic> json) =>
    ProjectSlideBlock(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      objectifs: (json['objectifs'] as List<dynamic>)
          .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectSlideBlockToJson(ProjectSlideBlock instance) =>
    <String, dynamic>{
      'project': instance.project.toJson(),
      'objectifs': instance.objectifs.map((e) => e.toJson()).toList(),
    };

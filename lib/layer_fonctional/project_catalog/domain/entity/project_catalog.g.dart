// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'project_catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectCatalog _$ProjectCatalogFromJson(Map<String, dynamic> json) =>
    ProjectCatalog(
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectCatalogToJson(ProjectCatalog instance) =>
    <String, dynamic>{
      'projects': instance.projects.map((e) => e.toJson()).toList(),
    };

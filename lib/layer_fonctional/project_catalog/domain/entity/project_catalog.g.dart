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
      objectifsByProjectId:
          (json['objectifsByProjectId'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              int.parse(k),
              (e as List<dynamic>)
                  .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
    );

Map<String, dynamic> _$ProjectCatalogToJson(ProjectCatalog instance) =>
    <String, dynamic>{
      'projects': instance.projects.map((e) => e.toJson()).toList(),
      'objectifsByProjectId': instance.objectifsByProjectId.map(
        (k, e) => MapEntry(k.toString(), e.map((e) => e.toJson()).toList()),
      ),
    };

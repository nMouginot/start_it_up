import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';

part 'project_catalog.g.dart';

@JsonSerializable()
class ProjectCatalog {
  final List<Project> projects;

  const ProjectCatalog({required this.projects});

  factory ProjectCatalog.fromJson(Map<String, dynamic> json) =>
      _$ProjectCatalogFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCatalogToJson(this);

  Iterable<Objectif> get allObjectifs =>
      projects.expand((project) => project.listObjectif);

  List<Objectif> objectifsOf(Project project) => project.listObjectif;
}

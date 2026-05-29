import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';

part 'project_catalog.g.dart';

@JsonSerializable()
class ProjectCatalog {
  final List<Project> projects;

  final Map<int, List<Objectif>> objectifsByProjectId;

  const ProjectCatalog({
    required this.projects,
    required this.objectifsByProjectId,
  });

  factory ProjectCatalog.fromJson(Map<String, dynamic> json) =>
      _$ProjectCatalogFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCatalogToJson(this);

  Iterable<Objectif> get allObjectifs =>
      objectifsByProjectId.values.expand((list) => list);

  List<Objectif> objectifsOf(Project project) =>
      objectifsByProjectId[project.id] ?? const [];
}

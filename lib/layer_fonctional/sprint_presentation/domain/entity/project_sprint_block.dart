import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';

part 'project_sprint_block.g.dart';

@JsonSerializable()
class ProjectSprintBlock {
  final Project project;

  final List<Objectif> objectifs;

  const ProjectSprintBlock({required this.project, required this.objectifs});

  factory ProjectSprintBlock.fromJson(Map<String, dynamic> json) =>
      _$ProjectSprintBlockFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectSprintBlockToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';

part 'project_slide_block.g.dart';

@JsonSerializable()
class ProjectSlideBlock {
  final Project project;

  final List<Objectif> objectifs;

  const ProjectSlideBlock({required this.project, required this.objectifs});

  factory ProjectSlideBlock.fromJson(Map<String, dynamic> json) =>
      _$ProjectSlideBlockFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectSlideBlockToJson(this);
}

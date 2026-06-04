import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';

part 'project_slide_entry.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class ProjectSlideEntry {
  final Project project;
  final List<Objectif> objectifs;

  const ProjectSlideEntry({required this.project, required this.objectifs});

  factory ProjectSlideEntry.fromJson(Map<String, dynamic> json) =>
      _$ProjectSlideEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectSlideEntryToJson(this);
}

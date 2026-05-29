import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import 'project_sprint_block.dart';
import 'sprint_timeframe.dart';

part 'sprint_presentation.g.dart';

@JsonSerializable()
class SprintPresentation {
  final SprintTimeframe timeframe;

  final List<ProjectSprintBlock> blocks;

  const SprintPresentation({required this.timeframe, required this.blocks});

  factory SprintPresentation.fromJson(Map<String, dynamic> json) =>
      _$SprintPresentationFromJson(json);

  Map<String, dynamic> toJson() => _$SprintPresentationToJson(this);

  int get totalObjectifs =>
      blocks.fold(0, (sum, block) => sum + block.objectifs.length);

  Iterable<Objectif> get allObjectifs =>
      blocks.expand((block) => block.objectifs);

  int get totalProjects => blocks.length;
}

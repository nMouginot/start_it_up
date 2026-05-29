import 'package:json_annotation/json_annotation.dart';

import '../../../objectif/domain/entity/objectif.dart';
import 'project_slide_block.dart';
import 'slide_timeframe.dart';

part 'slide_presentation.g.dart';

@JsonSerializable()
class SlidePresentation {
  final SlideTimeframe timeframe;

  final List<ProjectSlideBlock> blocks;

  const SlidePresentation({required this.timeframe, required this.blocks});

  factory SlidePresentation.fromJson(Map<String, dynamic> json) =>
      _$SlidePresentationFromJson(json);

  Map<String, dynamic> toJson() => _$SlidePresentationToJson(this);

  int get totalObjectifs =>
      blocks.fold(0, (sum, block) => sum + block.objectifs.length);

  Iterable<Objectif> get allObjectifs =>
      blocks.expand((block) => block.objectifs);

  int get totalProjects => blocks.length;
}

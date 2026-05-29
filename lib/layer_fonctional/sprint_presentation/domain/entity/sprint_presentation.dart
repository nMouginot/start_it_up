import '../../../objectif/domain/entity/objectif.dart';
import 'projet_sprint_block.dart';
import 'sprint_timeframe.dart';

/// Aggregated data needed to render the sprint presentation deck.
class SprintPresentation {
  final SprintTimeframe timeframe;

  final List<ProjetSprintBlock> blocks;

  const SprintPresentation({required this.timeframe, required this.blocks});

  int get totalObjectifs =>
      blocks.fold(0, (sum, block) => sum + block.objectifs.length);

  Iterable<Objectif> get allObjectifs =>
      blocks.expand((block) => block.objectifs);

  int get totalProjets => blocks.length;
}

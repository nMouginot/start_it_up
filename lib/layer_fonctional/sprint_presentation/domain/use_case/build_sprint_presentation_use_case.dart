import '../../../objectif/domain/use_case/get_objectifs_by_projet_use_case.dart';
import '../../../projet/domain/entity/projet.dart';
import '../entity/projet_sprint_block.dart';
import '../entity/sprint_presentation.dart';
import '../entity/sprint_timeframe.dart';

class BuildSprintPresentationUseCase {
  final GetObjectifsByProjetUseCase _getObjectifsByProjetUseCase;

  const BuildSprintPresentationUseCase({
    required GetObjectifsByProjetUseCase getObjectifsByProjetUseCase,
  }) : _getObjectifsByProjetUseCase = getObjectifsByProjetUseCase;

  Future<SprintPresentation> execute({
    required SprintTimeframe timeframe,
    required List<Projet> selectedProjets,
  }) async {
    final blocks = await Future.wait(
      selectedProjets.map((projet) async {
        final objectifs = await _getObjectifsByProjetUseCase.execute(projet.id);
        return ProjetSprintBlock(projet: projet, objectifs: objectifs);
      }),
    );
    return SprintPresentation(timeframe: timeframe, blocks: blocks);
  }
}

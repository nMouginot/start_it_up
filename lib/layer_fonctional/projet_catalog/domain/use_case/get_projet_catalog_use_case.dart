import '../../../objectif/domain/use_case/get_objectifs_by_projet_use_case.dart';
import '../../../projet/domain/use_case/get_projets_use_case.dart';
import '../entity/projet_catalog.dart';

class GetProjetCatalogUseCase {
  final GetProjetsUseCase _getProjetsUseCase;
  final GetObjectifsByProjetUseCase _getObjectifsByProjetUseCase;

  const GetProjetCatalogUseCase({
    required GetProjetsUseCase getProjetsUseCase,
    required GetObjectifsByProjetUseCase getObjectifsByProjetUseCase,
  }) : _getProjetsUseCase = getProjetsUseCase,
       _getObjectifsByProjetUseCase = getObjectifsByProjetUseCase;

  Future<ProjetCatalog> execute() async {
    final projets = await _getProjetsUseCase.execute();
    final entries = await Future.wait(
      projets.map((projet) async {
        final objectifs = await _getObjectifsByProjetUseCase.execute(projet.id);
        return MapEntry(projet.id, objectifs);
      }),
    );
    return ProjetCatalog(
      projets: projets,
      objectifsByProjetId: Map.fromEntries(entries),
    );
  }
}

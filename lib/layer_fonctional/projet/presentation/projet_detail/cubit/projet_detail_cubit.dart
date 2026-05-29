import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../objectif/domain/use_case/get_objectifs_by_projet_use_case.dart';
import '../../../domain/use_case/get_projet_by_id_use_case.dart';
import 'projet_detail_state.dart';

class ProjetDetailCubit extends Cubit<ProjetDetailState> {
  final GetProjetByIdUseCase _getProjetByIdUseCase;
  final GetObjectifsByProjetUseCase _getObjectifsByProjetUseCase;

  ProjetDetailCubit({
    required GetProjetByIdUseCase getProjetByIdUseCase,
    required GetObjectifsByProjetUseCase getObjectifsByProjetUseCase,
  }) : _getProjetByIdUseCase = getProjetByIdUseCase,
       _getObjectifsByProjetUseCase = getObjectifsByProjetUseCase,
       super(const ProjetDetailLoading());

  Future<void> load(int projetId) async {
    emit(const ProjetDetailLoading());
    try {
      final projetFuture = _getProjetByIdUseCase.execute(projetId);
      final objectifsFuture = _getObjectifsByProjetUseCase.execute(projetId);
      final projet = await projetFuture;
      final objectifs = await objectifsFuture;
      emit(ProjetDetailLoaded(projet: projet, objectifs: objectifs));
    } catch (error) {
      emit(ProjetDetailError(error));
    }
  }
}

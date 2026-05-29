import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_projets_use_case.dart';
import '../../projet_list/cubit/projet_list_state.dart';

class ProjetListCubit extends Cubit<ProjetListState> {
  final GetProjetsUseCase _getProjetsUseCase;

  ProjetListCubit({required GetProjetsUseCase getProjetsUseCase})
    : _getProjetsUseCase = getProjetsUseCase,
      super(const ProjetListLoading());

  Future<void> load() async {
    emit(const ProjetListLoading());
    try {
      final projets = await _getProjetsUseCase.execute();
      emit(ProjetListLoaded(projets));
    } catch (error) {
      emit(ProjetListError(error));
    }
  }
}

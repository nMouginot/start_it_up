import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../objectif/domain/entity/objectif.dart';
import '../../../../project_catalog/domain/use_case/get_project_catalog_use_case.dart';
import '../../../domain/entity/slide_timeframe.dart';
import '../../../domain/use_case/build_slide_presentation_use_case.dart';
import '../../../domain/use_case/get_slide_presentation_history_by_id_use_case.dart';
import '../../../domain/use_case/save_slide_presentation_history_use_case.dart';
import '../../presentation_launcher.dart';
import 'slide_setup_state.dart';

class SlideSetupCubit extends Cubit<SlideSetupState> {
  final GetProjectCatalogUseCase _getProjectCatalogUseCase;
  final BuildSlidePresentationUseCase _buildSlidePresentationUseCase;
  final SaveSlidePresentationHistoryUseCase _saveHistoryUseCase;
  final GetSlidePresentationHistoryByIdUseCase _getHistoryByIdUseCase;
  final PresentationLauncher _presentationLauncher;

  SlideSetupCubit({
    required GetProjectCatalogUseCase getProjectCatalogUseCase,
    required BuildSlidePresentationUseCase buildSlidePresentationUseCase,
    required SaveSlidePresentationHistoryUseCase saveHistoryUseCase,
    required GetSlidePresentationHistoryByIdUseCase getHistoryByIdUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _getProjectCatalogUseCase = getProjectCatalogUseCase,
       _buildSlidePresentationUseCase = buildSlidePresentationUseCase,
       _saveHistoryUseCase = saveHistoryUseCase,
       _getHistoryByIdUseCase = getHistoryByIdUseCase,
       _presentationLauncher = presentationLauncher,
       super(SlideSetupState.initial());

  Future<void> load({int? historyEntryId}) async {
    emit(state.copyWith(catalogLoading: true, error: null));
    try {
      final catalog = await _getProjectCatalogUseCase.execute();
      if (historyEntryId != null) {
        final dto = await _getHistoryByIdUseCase.execute(historyEntryId);
        if (dto != null) {
          final listSelectedObjectif = dto.presentation.blocks
              .expand((block) => block.objectifs)
              .toList();

          emit(
            state.copyWith(
              catalogLoading: false,
              catalog: catalog,
              timeframe: dto.presentation.timeframe,
              listSelectedObjectif: listSelectedObjectif,
              builtPresentation: dto.presentation,
            ),
          );
          return;
        }
      }
      emit(state.copyWith(catalogLoading: false, catalog: catalog));
    } catch (error) {
      emit(state.copyWith(catalogLoading: false, error: error));
    }
  }

  void toggleObjectif(Objectif objectif) {
    final next = List<Objectif>.from(state.listSelectedObjectif);
    final alreadySelected = next.any((o) => o.id == objectif.id);
    if (alreadySelected) {
      next.removeWhere((o) => o.id == objectif.id);
    } else {
      next.add(objectif);
    }
    emit(state.copyWith(listSelectedObjectif: next, builtPresentation: null));
  }

  void updateTimeframe(SlideTimeframe timeframe) {
    emit(state.copyWith(timeframe: timeframe, builtPresentation: null));
  }

  Future<void> generate() async {
    final catalog = state.catalog;
    if (!state.canGenerate || catalog == null) return;
    emit(state.copyWith(building: true, error: null, builtPresentation: null));
    try {
      final presentation = await _buildSlidePresentationUseCase.execute(
        timeframe: state.timeframe,
        catalog: catalog,
        selectedObjectif: state.listSelectedObjectif,
      );

      await _saveHistoryUseCase.execute(presentation: presentation);
      emit(state.copyWith(building: false, builtPresentation: presentation));
    } catch (error) {
      emit(state.copyWith(building: false, error: error));
    }
  }

  void launch() {
    final presentation = state.builtPresentation;
    if (presentation == null) return;
    _presentationLauncher.launch(presentation);
  }
}

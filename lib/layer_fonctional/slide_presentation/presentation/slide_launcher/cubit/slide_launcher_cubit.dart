import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../slide_presentation_history/domain/use_case/get_slide_presentation_history_use_case.dart';
import '../../presentation_launcher.dart';
import 'slide_launcher_state.dart';

class SlideLauncherCubit extends Cubit<SlideLauncherState> {
  final GetSlidePresentationHistoryUseCase _getHistoryUseCase;
  final PresentationLauncher _presentationLauncher;

  SlideLauncherCubit({
    required GetSlidePresentationHistoryUseCase getHistoryUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _getHistoryUseCase = getHistoryUseCase,
       _presentationLauncher = presentationLauncher,
       super(const SlideLauncherLoading());

  Future<void> launch(int historyEntryId) async {
    try {
      final entries = await _getHistoryUseCase.execute();
      final entry = entries.where((e) => e.id == historyEntryId).firstOrNull;
      if (entry == null) {
        emit(const SlideLauncherNotFound());
        return;
      }
      _presentationLauncher.launch(entry.presentation);
      emit(const SlideLauncherStarted());
    } catch (error) {
      emit(SlideLauncherError(error));
    }
  }
}

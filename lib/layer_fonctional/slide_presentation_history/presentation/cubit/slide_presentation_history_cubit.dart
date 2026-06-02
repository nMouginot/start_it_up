import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/get_slide_presentation_history_use_case.dart';
import 'slide_presentation_history_state.dart';

class SlidePresentationHistoryCubit
    extends Cubit<SlidePresentationHistoryState> {
  final GetSlidePresentationHistoryUseCase _getHistoryUseCase;

  SlidePresentationHistoryCubit({
    required GetSlidePresentationHistoryUseCase getHistoryUseCase,
  }) : _getHistoryUseCase = getHistoryUseCase,
       super(const SlidePresentationHistoryLoading());

  Future<void> load() async {
    emit(const SlidePresentationHistoryLoading());
    try {
      final entries = await _getHistoryUseCase.execute();
      emit(SlidePresentationHistoryLoaded(entries));
    } catch (error) {
      emit(SlidePresentationHistoryError(error));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dto/slide_presentation_history_dto.dart';
import '../../../domain/use_case/get_slide_presentation_history_use_case.dart';
import '../../presentation_launcher.dart';
import 'slide_history_state.dart';

class SlideHistoryCubit extends Cubit<SlideHistoryState> {
  final GetSlidePresentationHistoryUseCase _getHistoryUseCase;
  final PresentationLauncher _presentationLauncher;

  SlideHistoryCubit({
    required GetSlidePresentationHistoryUseCase getHistoryUseCase,
    required PresentationLauncher presentationLauncher,
  }) : _getHistoryUseCase = getHistoryUseCase,
       _presentationLauncher = presentationLauncher,
       super(const SlideHistoryLoading());

  Future<void> load() async {
    emit(const SlideHistoryLoading());
    try {
      final entries = await _getHistoryUseCase.execute();
      emit(SlideHistoryLoaded(entries));
    } catch (error) {
      emit(SlideHistoryError(error));
    }
  }

  void launch(SlidePresentationHistoryDto dto) {
    _presentationLauncher.launch(dto.presentation);
  }
}

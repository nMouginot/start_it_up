import '../../../data/dto/slide_presentation_history_dto.dart';

sealed class SlideHistoryState {
  const SlideHistoryState();
}

class SlideHistoryLoading extends SlideHistoryState {
  const SlideHistoryLoading();
}

class SlideHistoryLoaded extends SlideHistoryState {
  final List<SlidePresentationHistoryDto> entries;

  const SlideHistoryLoaded(this.entries);
}

class SlideHistoryError extends SlideHistoryState {
  final Object error;

  const SlideHistoryError(this.error);
}

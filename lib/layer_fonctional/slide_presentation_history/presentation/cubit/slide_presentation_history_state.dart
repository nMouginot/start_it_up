import '../../data/dto/slide_presentation_history_dto.dart';

sealed class SlidePresentationHistoryState {
  const SlidePresentationHistoryState();
}

class SlidePresentationHistoryLoading extends SlidePresentationHistoryState {
  const SlidePresentationHistoryLoading();
}

class SlidePresentationHistoryLoaded extends SlidePresentationHistoryState {
  final List<SlidePresentationHistoryDto> entries;

  const SlidePresentationHistoryLoaded(this.entries);
}

class SlidePresentationHistoryError extends SlidePresentationHistoryState {
  final Object error;

  const SlidePresentationHistoryError(this.error);
}

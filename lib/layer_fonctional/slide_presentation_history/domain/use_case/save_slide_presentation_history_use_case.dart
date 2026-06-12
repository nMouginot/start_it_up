import 'dart:math' as math;

import '../../../../layer_technical/history/domain/use_case/get_history_use_case.dart';
import '../../../../layer_technical/history/domain/use_case/save_history_use_case.dart';
import '../../../slide_presentation/domain/entity/slide_presentation.dart';
import '../../data/dto/slide_presentation_history_dto.dart';

class SaveSlidePresentationHistoryUseCase {
  final SaveHistoryUseCase _saveHistory;
  final GetHistoryUseCase _getHistory;

  const SaveSlidePresentationHistoryUseCase({
    required SaveHistoryUseCase saveHistory,
    required GetHistoryUseCase getHistory,
  }) : _saveHistory = saveHistory,
       _getHistory = getHistory;

  Future<SlidePresentationHistoryDto> execute({
    required SlidePresentation presentation,
  }) async {
    final existing = await _getHistory.execute(
      collection: SlidePresentationHistoryDto.collection,
      fromJson: SlidePresentationHistoryDto.fromJson,
    );
    final nextId = existing.fold(0, (max, e) => math.max(max, e.id)) + 1;
    final dto = SlidePresentationHistoryDto(
      id: nextId,
      createdAt: DateTime.now(),
      presentation: presentation,
    );
    await _saveHistory.execute(
      collection: SlidePresentationHistoryDto.collection,
      items: [...existing, dto],
      toJson: (entry) => entry.toJson(),
    );
    return dto;
  }
}

import '../../../../layer_technical/history/domain/use_case/get_history_use_case.dart';
import '../../data/dto/slide_presentation_history_dto.dart';

class GetSlidePresentationHistoryUseCase {
  final GetHistoryUseCase _getHistory;

  const GetSlidePresentationHistoryUseCase({
    required GetHistoryUseCase getHistory,
  }) : _getHistory = getHistory;

  Future<List<SlidePresentationHistoryDto>> execute() async {
    final entries = await _getHistory.execute(
      collection: SlidePresentationHistoryDto.collection,
      fromJson: SlidePresentationHistoryDto.fromJson,
    );
    if (entries.isEmpty) {
      return [];
    }
    return entries..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}

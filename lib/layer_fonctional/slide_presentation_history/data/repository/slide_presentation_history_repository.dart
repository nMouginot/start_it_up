import '../../../slide_presentation/domain/entity/slide_presentation.dart';
import '../dto/slide_presentation_history_dto.dart';

class SlidePresentationHistoryRepository {
  final List<SlidePresentationHistoryDto> _entries = [];
  int _nextId = 1;

  Future<List<SlidePresentationHistoryDto>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final sorted = List<SlidePresentationHistoryDto>.from(_entries)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sorted;
  }

  Future<SlidePresentationHistoryDto> save({
    required SlidePresentation presentation,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final dto = SlidePresentationHistoryDto(
      id: _nextId++,
      createdAt: DateTime.now(),
      presentation: presentation,
    );
    _entries.add(dto);
    return dto;
  }
}

import '../../domain/entity/slide_presentation.dart';
import '../dto/slide_presentation_history_dto.dart';

class SlidePresentationHistoryRepository {
  final Map<int, SlidePresentationHistoryDto> _store = {};
  int _nextId = 1;

  Future<List<SlidePresentationHistoryDto>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final sorted = _store.values.toList(growable: false)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sorted;
  }

  Future<SlidePresentationHistoryDto?> fetchById(int id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _store[id];
  }

  Future<SlidePresentationHistoryDto> save({
    int? id,
    required SlidePresentation presentation,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (id != null && _store.containsKey(id)) {
      final updated = SlidePresentationHistoryDto(
        id: id,
        createdAt: _store[id]!.createdAt,
        presentation: presentation,
      );
      _store[id] = updated;
      return updated;
    }
    final newId = id ?? _nextId++;
    if (newId >= _nextId) _nextId = newId + 1;
    final dto = SlidePresentationHistoryDto(
      id: newId,
      createdAt: DateTime.now(),
      presentation: presentation,
    );
    _store[newId] = dto;
    return dto;
  }
}

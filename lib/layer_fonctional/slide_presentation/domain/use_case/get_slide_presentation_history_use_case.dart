import '../../data/dto/slide_presentation_history_dto.dart';
import '../../data/repository/slide_presentation_history_repository.dart';

class GetSlidePresentationHistoryUseCase {
  final SlidePresentationHistoryRepository _repository;

  const GetSlidePresentationHistoryUseCase({
    required SlidePresentationHistoryRepository repository,
  }) : _repository = repository;

  Future<List<SlidePresentationHistoryDto>> execute() => _repository.fetchAll();
}

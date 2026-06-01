import '../../data/dto/slide_presentation_history_dto.dart';
import '../../data/repository/slide_presentation_history_repository.dart';

class GetSlidePresentationHistoryByIdUseCase {
  final SlidePresentationHistoryRepository _repository;

  const GetSlidePresentationHistoryByIdUseCase({
    required SlidePresentationHistoryRepository repository,
  }) : _repository = repository;

  Future<SlidePresentationHistoryDto?> execute(int id) =>
      _repository.fetchById(id);
}

import '../../data/dto/slide_presentation_history_dto.dart';
import '../../data/repository/slide_presentation_history_repository.dart';
import '../entity/slide_presentation.dart';

class SaveSlidePresentationHistoryUseCase {
  final SlidePresentationHistoryRepository _repository;

  const SaveSlidePresentationHistoryUseCase({
    required SlidePresentationHistoryRepository repository,
  }) : _repository = repository;

  Future<SlidePresentationHistoryDto> execute({
    int? id,
    required SlidePresentation presentation,
  }) => _repository.save(id: id, presentation: presentation);
}

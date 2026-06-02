import '../../../slide_presentation/domain/entity/slide_presentation.dart';
import '../../data/dto/slide_presentation_history_dto.dart';
import '../../data/repository/slide_presentation_history_repository.dart';

class SaveSlidePresentationHistoryUseCase {
  final SlidePresentationHistoryRepository _repository;

  const SaveSlidePresentationHistoryUseCase({
    required SlidePresentationHistoryRepository repository,
  }) : _repository = repository;

  Future<SlidePresentationHistoryDto> execute({
    required SlidePresentation presentation,
  }) => _repository.save(presentation: presentation);
}

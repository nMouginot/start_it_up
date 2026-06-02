import '../../domain/entity/slide_presentation.dart';

class SlidePresentationHistoryDto {
  final int id;
  final DateTime createdAt;
  final SlidePresentation presentation;

  const SlidePresentationHistoryDto({
    required this.id,
    required this.createdAt,
    required this.presentation,
  });
}

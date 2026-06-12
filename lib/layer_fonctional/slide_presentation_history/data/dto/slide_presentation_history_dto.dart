import '../../../slide_presentation/data/mapper/slide_presentation_mapper.dart';
import '../../../slide_presentation/domain/entity/slide_presentation.dart';

class SlidePresentationHistoryDto {
  static const String collection = 'slide_presentation_history';

  final int id;
  final DateTime createdAt;
  final SlidePresentation presentation;

  const SlidePresentationHistoryDto({
    required this.id,
    required this.createdAt,
    required this.presentation,
  });

  factory SlidePresentationHistoryDto.fromJson(Map<String, dynamic> json) =>
      SlidePresentationHistoryDto(
        id: json['id'] as int,
        createdAt: DateTime.parse(json['createdAt'] as String),
        presentation: slidePresentationFromJson(
          json['presentation'] as Map<String, dynamic>,
        ),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt.toIso8601String(),
    'presentation': slidePresentationToJson(presentation),
  };
}

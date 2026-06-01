import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/slide_presentation.dart';

part 'slide_presentation_history_dto.g.dart';

@JsonSerializable()
class SlidePresentationHistoryDto {
  final int id;
  final DateTime createdAt;
  final SlidePresentation presentation;

  const SlidePresentationHistoryDto({
    required this.id,
    required this.createdAt,
    required this.presentation,
  });

  factory SlidePresentationHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$SlidePresentationHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SlidePresentationHistoryDtoToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_presentation_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidePresentationHistoryDto _$SlidePresentationHistoryDtoFromJson(
  Map<String, dynamic> json,
) => SlidePresentationHistoryDto(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  presentation: SlidePresentation.fromJson(
    json['presentation'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SlidePresentationHistoryDtoToJson(
  SlidePresentationHistoryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'presentation': instance.presentation.toJson(),
};

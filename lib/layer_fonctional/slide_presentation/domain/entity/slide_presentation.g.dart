// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'slide_presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidePresentation _$SlidePresentationFromJson(Map<String, dynamic> json) =>
    SlidePresentation(
      timeframe: SlideTimeframe.fromJson(
        json['timeframe'] as Map<String, dynamic>,
      ),
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => ProjectSlideBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlidePresentationToJson(SlidePresentation instance) =>
    <String, dynamic>{
      'timeframe': instance.timeframe.toJson(),
      'blocks': instance.blocks.map((e) => e.toJson()).toList(),
    };

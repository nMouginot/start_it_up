// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'sprint_presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SprintPresentation _$SprintPresentationFromJson(Map<String, dynamic> json) =>
    SprintPresentation(
      timeframe: SprintTimeframe.fromJson(
        json['timeframe'] as Map<String, dynamic>,
      ),
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => ProjetSprintBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SprintPresentationToJson(SprintPresentation instance) =>
    <String, dynamic>{
      'timeframe': instance.timeframe.toJson(),
      'blocks': instance.blocks.map((e) => e.toJson()).toList(),
    };

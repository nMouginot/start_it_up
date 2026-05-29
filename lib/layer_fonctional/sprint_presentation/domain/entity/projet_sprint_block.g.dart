// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'projet_sprint_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjetSprintBlock _$ProjetSprintBlockFromJson(Map<String, dynamic> json) =>
    ProjetSprintBlock(
      projet: Projet.fromJson(json['projet'] as Map<String, dynamic>),
      objectifs: (json['objectifs'] as List<dynamic>)
          .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjetSprintBlockToJson(ProjetSprintBlock instance) =>
    <String, dynamic>{
      'projet': instance.projet.toJson(),
      'objectifs': instance.objectifs.map((e) => e.toJson()).toList(),
    };

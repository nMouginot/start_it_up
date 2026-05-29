// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'projet_catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjetCatalog _$ProjetCatalogFromJson(Map<String, dynamic> json) =>
    ProjetCatalog(
      projets: (json['projets'] as List<dynamic>)
          .map((e) => Projet.fromJson(e as Map<String, dynamic>))
          .toList(),
      objectifsByProjetId: (json['objectifsByProjetId'] as Map<String, dynamic>)
          .map(
            (k, e) => MapEntry(
              int.parse(k),
              (e as List<dynamic>)
                  .map((e) => Objectif.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
    );

Map<String, dynamic> _$ProjetCatalogToJson(ProjetCatalog instance) =>
    <String, dynamic>{
      'projets': instance.projets.map((e) => e.toJson()).toList(),
      'objectifsByProjetId': instance.objectifsByProjetId.map(
        (k, e) => MapEntry(k.toString(), e.map((e) => e.toJson()).toList()),
      ),
    };

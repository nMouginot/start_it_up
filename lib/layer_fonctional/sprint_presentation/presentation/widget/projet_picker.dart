import 'package:flutter/material.dart';

import '../../../projet/domain/entity/projet.dart';

class ProjetPicker extends StatelessWidget {
  final List<Projet> projets;
  final Set<int> selectedIds;
  final ValueChanged<Projet> onToggle;

  const ProjetPicker({
    super.key,
    required this.projets,
    required this.selectedIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (projets.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('Aucun projet disponible.'),
      );
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: projets
          .map(
            (projet) => FilterChip(
              label: Text(projet.name),
              selected: selectedIds.contains(projet.id),
              onSelected: (_) => onToggle(projet),
            ),
          )
          .toList(growable: false),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../objectif/domain/entity/objectif.dart';
import '../../../projet/domain/entity/projet.dart';
import '../../../projet_catalog/domain/entity/projet_catalog.dart';

/// Lets the user pick objectifs for the next sprint, grouped by their parent
/// projet for easy scanning. Selection happens at the objectif level —
/// projets are only a visual group, not selectable as a whole.
class ObjectifPicker extends StatelessWidget {
  final ProjetCatalog catalog;
  final Set<int> selectedObjectifIds;
  final ValueChanged<Objectif> onToggle;

  const ObjectifPicker({
    super.key,
    required this.catalog,
    required this.selectedObjectifIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (catalog.projets.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('Aucun projet disponible.'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final projet in catalog.projets)
          if (catalog.objectifsOf(projet).isNotEmpty)
            _ProjetSection(
              projet: projet,
              objectifs: catalog.objectifsOf(projet),
              selectedObjectifIds: selectedObjectifIds,
              onToggle: onToggle,
            ),
      ],
    );
  }
}

class _ProjetSection extends StatelessWidget {
  final Projet projet;
  final List<Objectif> objectifs;
  final Set<int> selectedObjectifIds;
  final ValueChanged<Objectif> onToggle;

  const _ProjetSection({
    required this.projet,
    required this.objectifs,
    required this.selectedObjectifIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedCount = objectifs
        .where((objectif) => selectedObjectifIds.contains(objectif.id))
        .length;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    projet.name,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Text(
                  '$selectedCount / ${objectifs.length}',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          for (final objectif in objectifs)
            _ObjectifTile(
              objectif: objectif,
              selected: selectedObjectifIds.contains(objectif.id),
              onToggle: () => onToggle(objectif),
            ),
        ],
      ),
    );
  }
}

class _ObjectifTile extends StatelessWidget {
  final Objectif objectif;
  final bool selected;
  final VoidCallback onToggle;

  const _ObjectifTile({
    required this.objectif,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: selected,
      onChanged: (_) => onToggle(),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(objectif.title),
      subtitle: Text(
        '${objectif.status.label} • Échéance ${objectif.deadline.formattedDayMonth}',
      ),
    );
  }
}

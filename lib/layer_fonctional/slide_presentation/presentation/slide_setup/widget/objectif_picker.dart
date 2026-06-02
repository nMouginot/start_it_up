import 'package:flutter/material.dart';

import '../../../../../layer_technical/extension/date_time_extension.dart';
import '../../../../objectif/domain/entity/objectif.dart';
import '../../../../project/domain/entity/project.dart';

class ObjectifPicker extends StatelessWidget {
  final List<Project> projects;
  final List<Objectif> listSelectedObjectif;
  final ValueChanged<Objectif> onToggle;

  const ObjectifPicker({
    super.key,
    required this.projects,
    required this.listSelectedObjectif,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text('Aucun project disponible.'),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final project in projects)
          if (project.listObjectif.isNotEmpty)
            _ProjectSection(
              project: project,
              listSelectedObjectif: listSelectedObjectif,
              onToggle: onToggle,
            ),
      ],
    );
  }
}

class _ProjectSection extends StatelessWidget {
  final Project project;
  final List<Objectif> listSelectedObjectif;
  final ValueChanged<Objectif> onToggle;

  const _ProjectSection({
    required this.project,
    required this.listSelectedObjectif,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final objectifs = project.listObjectif;
    final selectedCount = objectifs
        .where(
          (objectif) => listSelectedObjectif.any((s) => s.id == objectif.id),
        )
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
                  child: Text(project.name, style: theme.textTheme.titleMedium),
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
              selected: listSelectedObjectif.any((o) => o.id == objectif.id),
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

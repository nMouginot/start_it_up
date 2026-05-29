import 'package:flutter/material.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../domain/entity/objectif.dart';

class ObjectifListTile extends StatelessWidget {
  final Objectif objectif;
  final VoidCallback? onEdit;

  const ObjectifListTile({super.key, required this.objectif, this.onEdit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(objectif.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(objectif.description, style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          Row(
            children: [
              _Badge(label: objectif.status.label),
              const SizedBox(width: 8),
              _Badge(label: 'Échéance ${objectif.deadline.formattedDayMonth}'),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
      isThreeLine: true,
      trailing: onEdit == null
          ? null
          : IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Modifier',
              onPressed: onEdit,
            ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;

  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: theme.textTheme.labelSmall),
    );
  }
}

import 'package:flutter/material.dart';

import '../../domain/entity/dropdown_item.dart';

typedef MultiSelectDropdownChipBuilder<T> =
    Widget Function(
      BuildContext context,
      DropdownItem<T> item,
      VoidCallback onDelete,
    );

class DropdownItemChip<T> extends StatelessWidget {
  final DropdownItem<T> item;
  final VoidCallback onDeleted;

  const DropdownItemChip({
    super.key,
    required this.item,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Chip(
      onDeleted: onDeleted,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      backgroundColor: colorScheme.secondaryContainer,
      deleteIconColor: colorScheme.onSecondaryContainer,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      deleteIcon: const Icon(Icons.close, size: 14),
      label: Text(
        item.chipLabel,
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

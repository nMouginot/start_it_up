import 'package:flutter/material.dart';

import '../../domain/entity/dropdown_item.dart';

typedef MultiSelectDropdownListTileBuilder<T> =
    Widget Function(
      BuildContext context,
      DropdownItem<T> item,
      VoidCallback onTap,
    );

class MultiSelectDropdownListTile<T> extends StatelessWidget {
  final DropdownItem<T> item;
  final VoidCallback onTap;

  const MultiSelectDropdownListTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        color: item.isSelected
            ? colorScheme.onSurface.withAlpha(25)
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(item.label, style: theme.textTheme.bodyMedium),
            ),
            if (item.isSelected)
              Icon(
                Icons.check,
                size: 18,
                color: colorScheme.onSurface.withAlpha(150),
              ),
          ],
        ),
      ),
    );
  }
}

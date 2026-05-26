import 'package:flutter/material.dart';

import '../../domain/entity/dropdown_item.dart';
import 'multi_select_dropdown_item_chip.dart';

typedef MultiSelectDropdownAnchorBuilder<T> =
    Widget Function(
      BuildContext context,
      List<DropdownItem<T>> selectedItems,
      bool isOpen,
      VoidCallback onTap,
      void Function(DropdownItem<T> value) onItemDeleted,
      MultiSelectDropdownChipBuilder<T>? chipBuilder,
    );

class MultiSelectDropdownAnchor<T> extends StatelessWidget {
  final List<DropdownItem<T>> selectedItems;
  final bool isOpen;
  final String hint;
  final VoidCallback onTap;
  final MultiSelectDropdownChipBuilder<T>? chipBuilder;
  final void Function(DropdownItem<T> value) onItemDeleted;

  const MultiSelectDropdownAnchor({
    super.key,
    required this.selectedItems,
    required this.onItemDeleted,
    required this.isOpen,
    required this.hint,
    required this.onTap,
    this.chipBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isOpen ? colorScheme.onPrimary : colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: colorScheme.surface,
        ),
        child: Row(
          children: [
            Expanded(
              child: selectedItems.isEmpty
                  ? Text(hint, style: const TextStyle(color: Colors.grey))
                  : Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: selectedItems.map((dropdownItem) {
                        return chipBuilder != null
                            ? chipBuilder!(
                                context,
                                dropdownItem,
                                () => onItemDeleted(dropdownItem),
                              )
                            : DropdownItemChip<T>(
                                item: dropdownItem,
                                onDeleted: () => onItemDeleted(dropdownItem),
                              );
                      }).toList(),
                    ),
            ),
            Icon(
              isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

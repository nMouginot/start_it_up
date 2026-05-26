import 'package:flutter/material.dart';

import '../../../domain/entity/dropdown_item.dart';
import '../multi_select_dropdown_list_tile.dart';

class DropdownListWidget<T> extends StatelessWidget {
  const DropdownListWidget({
    required this.items,
    required this.onTap,
    this.listTileBuilder,
  });

  final List<DropdownItem<T>> items;
  final ValueChanged<DropdownItem<T>> onTap;
  final MultiSelectDropdownListTileBuilder<T>? listTileBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final onItemTap = () => onTap(item);
        return listTileBuilder?.call(context, item, onItemTap) ??
            MultiSelectDropdownListTile<T>(item: item, onTap: onItemTap);
      },
    );
  }
}

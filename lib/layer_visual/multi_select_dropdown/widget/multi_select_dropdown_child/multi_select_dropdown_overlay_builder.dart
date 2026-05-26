import 'package:flutter/material.dart';

import '../multi_select_dropdown.dart';
import 'multi_select_dropdown_overlay_builder_child/overlay_builder_loading.dart';
import 'multi_select_dropdown_overlay_builder_child/overlay_builder_empty.dart';
import 'multi_select_dropdown_overlay_builder_child/overlay_builder_list.dart';
import 'multi_select_dropdown_search_field.dart';
import 'multi_select_dropdown_list_tile.dart';

typedef MultiSelectDropdownOverlayBuilder<T> =
    Widget Function(
      BuildContext context, {
      double width,
      bool isLoading,
      double maxHeight,
      LayerLink layerLink,
      VoidCallback onClose,
      List<DropdownItem<T>> items,
      List<DropdownItem<T>> selectedItems,
      ValueChanged<DropdownItem<T>>? onItemToggled,
      ValueChanged<List<DropdownItem<T>>>? onSelectionChanged,
      Widget? emptyWidgetBuilder,
      Widget? loadingWidgetBuilder,
      MultiSelectDropdownListTileBuilder<T>? listTileBuilder,
      MultiSelectDropdownSearchFieldBuilder? searchFieldBuilder,
      String searchHint,
      String searchQuery,
      ValueChanged<String>? onSearchChanged,
    });

class DropdownOverlay<T> extends StatelessWidget {
  final LayerLink layerLink;
  final double width;
  final double maxHeight;
  final String searchHint;
  final VoidCallback onClose;
  final bool isLoading;
  final String searchQuery;
  final List<DropdownItem<T>> items;
  final List<DropdownItem<T>> selectedItems;
  final Widget? emptyWidgetBuilder;
  final Widget? loadingWidgetBuilder;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<DropdownItem<T>>? onItemToggled;
  final MultiSelectDropdownListTileBuilder<T>? listTileBuilder;
  final ValueChanged<List<DropdownItem<T>>>? onSelectionChanged;
  final MultiSelectDropdownSearchFieldBuilder? searchFieldBuilder;

  const DropdownOverlay({
    super.key,
    required this.layerLink,
    required this.width,
    required this.maxHeight,
    required this.searchHint,
    required this.onClose,
    required this.isLoading,
    required this.searchQuery,
    required this.items,
    required this.selectedItems,
    this.emptyWidgetBuilder,
    this.onSearchChanged,
    this.onItemToggled,
    this.onSelectionChanged,
    this.searchFieldBuilder,
    this.listTileBuilder,
    this.loadingWidgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget defaultSearchFieldBuilder(
      BuildContext context,
      String hint,
      String initialValue,
      ValueChanged<String> onChanged,
    ) => DropdownSearchField(
      hint: hint,
      onChanged: onChanged,
      initialValue: initialValue,
    );

    final body = switch (true) {
      _ when isLoading => DropdownLoadingWidget(child: loadingWidgetBuilder),
      _ when items.isEmpty => DropdownEmptyWidget(child: emptyWidgetBuilder),
      _ => DropdownListWidget<T>(
        items: items,
        onTap: (item) => onItemToggled?.call(item),
        listTileBuilder: listTileBuilder,
      ),
    };

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: width,
        constraints: BoxConstraints(maxHeight: maxHeight),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: (searchFieldBuilder ?? defaultSearchFieldBuilder)(
                context,
                searchHint,
                searchQuery,
                (query) => onSearchChanged?.call(query),
              ),
            ),
            Divider(
              height: 0.1,
              indent: 5,
              endIndent: 5,
              color: colorScheme.outline.withAlpha(100),
            ),
            Flexible(child: body),
          ],
        ),
      ),
    );
  }
}

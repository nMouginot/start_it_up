import 'package:flutter/material.dart';

import '../domain/entity/dropdown_item.dart';
import 'multi_select_dropdown_child/multi_select_dropdown_item_chip.dart';
import 'multi_select_dropdown_child/multi_select_dropdown_anchor.dart';
import 'multi_select_dropdown_child/multi_select_dropdown_list_tile.dart';
import 'multi_select_dropdown_child/multi_select_dropdown_overlay_builder.dart';
import 'multi_select_dropdown_child/multi_select_dropdown_search_field.dart';
export 'multi_select_dropdown_child/multi_select_dropdown_anchor.dart';
export '../domain/entity/dropdown_item.dart';

class MultiSelectDropdown<T> extends StatelessWidget {
  final String hint;
  final String searchHint;
  final String? initialSearchQuery;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;
  final double maxDropdownHeight;
  final bool isLoading;
  final List<DropdownItem<T>> items;
  final List<DropdownItem<T>> selectedItems;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<List<DropdownItem<T>>>? onSelectionChanged;
  final Widget? emptyWidgetBuilder;
  final Widget? loadingWidgetBuilder;
  final MultiSelectDropdownChipBuilder<T>? chipBuilder;
  final MultiSelectDropdownAnchorBuilder<T>? anchorBuilder;
  final MultiSelectDropdownOverlayBuilder<T>? overlayBuilder;
  final MultiSelectDropdownListTileBuilder<T>? listTileBuilder;

  /// Builder for a custom search field.
  ///
  /// **Important:** Do NOT create a `TextEditingController` inline like:
  /// controller: TextEditingController(text: initialValue)
  ///
  /// This will recreate the controller on every rebuild, resetting the cursor
  /// to the start while typing.
  ///
  /// To preserve the search query when reopening the dropdown AND avoid cursor
  /// reset issues, wrap your `TextField` in a `StatefulWidget` with a
  /// persistent controller seeded from [initialValue]:
  ///
  /// You can check how the widget DropdownSearchField() is created if you need an example.
  final MultiSelectDropdownSearchFieldBuilder? searchFieldBuilder;

  const MultiSelectDropdown({
    super.key,
    required this.items,
    required this.selectedItems,
    this.isLoading = false,
    this.onOpen,
    this.onClose,
    this.emptyWidgetBuilder,
    this.onSearchChanged,
    this.onSelectionChanged,
    this.hint = 'Select items',
    this.searchHint = 'Search...',
    this.maxDropdownHeight = 300,
    this.anchorBuilder,
    this.chipBuilder,
    this.searchFieldBuilder,
    this.listTileBuilder,
    this.overlayBuilder,
    this.loadingWidgetBuilder,
    this.initialSearchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return _MultiSelectDropdownContent<T>(
      items: items,
      selectedItems: selectedItems,
      isLoading: isLoading,
      initialSearchQuery: initialSearchQuery,
      onSearchChanged: onSearchChanged,
      onSelectionChanged: onSelectionChanged,
      onOpen: onOpen,
      onClose: onClose,
      hint: hint,
      searchHint: searchHint,
      overlayBuilder: overlayBuilder,
      listTileBuilder: listTileBuilder,
      maxDropdownHeight: maxDropdownHeight,
      emptyWidget: emptyWidgetBuilder,
      chipBuilder: chipBuilder,
      anchorBuilder: anchorBuilder,
      searchFieldBuilder: searchFieldBuilder,
      loadingWidgetBuilder: loadingWidgetBuilder,
    );
  }
}

class _MultiSelectDropdownContent<T> extends StatefulWidget {
  final MultiSelectDropdownSearchFieldBuilder? searchFieldBuilder;
  final ValueChanged<List<DropdownItem<T>>>? onSelectionChanged;
  final MultiSelectDropdownListTileBuilder<T>? listTileBuilder;
  final MultiSelectDropdownOverlayBuilder<T>? overlayBuilder;
  final MultiSelectDropdownAnchorBuilder<T>? anchorBuilder;
  final MultiSelectDropdownChipBuilder<T>? chipBuilder;
  final ValueChanged<String>? onSearchChanged;
  final String? initialSearchQuery;
  final Widget? loadingWidgetBuilder;
  final double maxDropdownHeight;
  final List<DropdownItem<T>> items;
  final List<DropdownItem<T>> selectedItems;
  final bool isLoading;
  final VoidCallback? onClose;
  final VoidCallback? onOpen;
  final Widget? emptyWidget;
  final String searchHint;
  final String hint;

  const _MultiSelectDropdownContent({
    required this.items,
    required this.selectedItems,
    required this.isLoading,
    this.onSearchChanged,
    this.onSelectionChanged,
    this.onOpen,
    this.onClose,
    required this.hint,
    required this.searchHint,
    required this.maxDropdownHeight,
    this.searchFieldBuilder,
    this.anchorBuilder,
    this.emptyWidget,
    this.chipBuilder,
    this.listTileBuilder,
    this.overlayBuilder,
    this.loadingWidgetBuilder,
    this.initialSearchQuery,
  });

  @override
  State<_MultiSelectDropdownContent<T>> createState() =>
      _MultiSelectDropdownContentState<T>();
}

class _MultiSelectDropdownContentState<T>
    extends State<_MultiSelectDropdownContent<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late OverlayState _overlay;
  String _searchQuery = '';
  bool _isOpen = false;

  List<DropdownItem<T>> get _resolvedItems => widget.items
      .map(
        (item) =>
            item.copyWith(isSelected: widget.selectedItems.contains(item)),
      )
      .toList();

  @override
  void initState() {
    super.initState();
    _searchQuery = widget.initialSearchQuery ?? '';
  }

  @override
  void didUpdateWidget(_MultiSelectDropdownContent<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _overlayEntry?.markNeedsBuild();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _overlay = Overlay.of(context);
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggle() {
    if (_isOpen) {
      _close();
    } else {
      _open();
    }
  }

  void _open() {
    setState(() => _isOpen = true);
    _insertOverlay();
    widget.onOpen?.call();
  }

  void _close() {
    setState(() {
      _isOpen = false;
    });
    _removeOverlay();
    widget.onClose?.call();
  }

  void _onItemToggled(DropdownItem<T> item) {
    final isSelected = widget.selectedItems.contains(item);
    final updated = isSelected
        ? widget.selectedItems.where((e) => e != item).toList()
        : [...widget.selectedItems, item];
    widget.onSelectionChanged?.call(updated);
    _overlayEntry?.markNeedsBuild();
  }

  void _onItemDeselected(DropdownItem<T> item) {
    final updated = widget.selectedItems.where((e) => e != item).toList();
    widget.onSelectionChanged?.call(updated);
  }

  void _insertOverlay() {
    _overlayEntry = _buildOverlayEntry();
    _overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool _computeShowAbove(Size size) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    final spaceBelow = screenHeight - offset.dy - size.height;
    final spaceAbove = offset.dy;

    return spaceBelow < widget.maxDropdownHeight && spaceAbove > spaceBelow;
  }

  OverlayEntry _buildOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final showAbove = _computeShowAbove(size);

    return OverlayEntry(
      builder: (context) {
        final overlayChild =
            widget.overlayBuilder?.call(
              context,
              width: size.width,
              items: _resolvedItems,
              layerLink: _layerLink,
              isLoading: widget.isLoading,
              maxHeight: widget.maxDropdownHeight,
              selectedItems: widget.selectedItems,
              searchQuery: _searchQuery,
              searchHint: widget.searchHint,
              onSearchChanged: (query) {
                _searchQuery = query;
                _overlayEntry?.markNeedsBuild();
                widget.onSearchChanged?.call(query);
              },
              onClose: _close,
              onItemToggled: _onItemToggled,
              onSelectionChanged: widget.onSelectionChanged,
              listTileBuilder: widget.listTileBuilder,
              emptyWidgetBuilder: widget.emptyWidget,
              searchFieldBuilder: widget.searchFieldBuilder,
              loadingWidgetBuilder: widget.loadingWidgetBuilder,
            ) ??
            DropdownOverlay<T>(
              layerLink: _layerLink,
              width: size.width,
              maxHeight: widget.maxDropdownHeight,
              searchHint: widget.searchHint,
              onClose: _close,
              isLoading: widget.isLoading,
              searchQuery: _searchQuery,
              items: _resolvedItems,
              selectedItems: widget.selectedItems,
              emptyWidgetBuilder: widget.emptyWidget,
              loadingWidgetBuilder: widget.loadingWidgetBuilder,
              onSearchChanged: (query) {
                _searchQuery = query;
                _overlayEntry?.markNeedsBuild();
                widget.onSearchChanged?.call(query);
              },
              onItemToggled: _onItemToggled,
              listTileBuilder: widget.listTileBuilder,
              onSelectionChanged: widget.onSelectionChanged,
              searchFieldBuilder: widget.searchFieldBuilder,
            );

        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _close,
                behavior: HitTestBehavior.translucent,
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: showAbove
                  ? Alignment.topLeft
                  : Alignment.bottomLeft,
              followerAnchor: showAbove
                  ? Alignment.bottomLeft
                  : Alignment.topLeft,
              child: overlayChild,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final anchor = widget.anchorBuilder != null
        ? widget.anchorBuilder!(
            context,
            widget.selectedItems,
            _isOpen,
            _toggle,
            _onItemDeselected,
            widget.chipBuilder,
          )
        : MultiSelectDropdownAnchor(
            selectedItems: widget.selectedItems,
            isOpen: _isOpen,
            hint: widget.hint,
            onTap: _toggle,
            onItemDeleted: _onItemDeselected,
            chipBuilder: widget.chipBuilder,
          );

    return CompositedTransformTarget(link: _layerLink, child: anchor);
  }
}

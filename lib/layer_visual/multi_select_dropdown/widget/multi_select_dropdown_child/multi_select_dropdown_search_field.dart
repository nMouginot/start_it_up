import 'package:flutter/material.dart';

typedef MultiSelectDropdownSearchFieldBuilder =
    Widget Function(
      BuildContext context, {
      required String hint,
      required String initialValue,
      required ValueChanged<String> onChanged,
    });

class DropdownSearchField extends StatelessWidget {
  final String hint;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const DropdownSearchField({
    super.key,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onPrimary,
        ),
        filled: true,
        fillColor: colorScheme.onSurface.withAlpha(25),
        prefixIcon: Icon(Icons.search, size: 20, color: colorScheme.onPrimary),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: colorScheme.onPrimary, width: 1),
        ),
      ),
    );
  }
}

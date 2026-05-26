import 'package:flutter/material.dart';

class DropdownEmptyWidget extends StatelessWidget {
  const DropdownEmptyWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child ??
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Auncun item trouvé",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        );
  }
}

import 'package:flutter/material.dart';

class DropdownLoadingWidget extends StatelessWidget {
  const DropdownLoadingWidget({this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child ??
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
            ),
          ),
        );
  }
}

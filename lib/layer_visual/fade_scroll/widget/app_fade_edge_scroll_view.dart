import 'package:flutter/material.dart';

import 'app_fade_mask.dart';

class AppFadeEdgeScrollView extends StatelessWidget {
  final Widget child;
  final double fadeSize;
  final Axis scrollDirection;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool? primary;
  final bool reverse;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Clip clipBehavior;

  const AppFadeEdgeScrollView({
    super.key,
    required this.child,
    this.fadeSize = 16.0,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.padding,
    this.physics,
    this.primary,
    this.reverse = false,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.clipBehavior = Clip.hardEdge,
  });

  @override
  Widget build(BuildContext context) {
    return AppFadeMask(
      fadeSize: fadeSize,
      scrollDirection: scrollDirection,
      child: SingleChildScrollView(
        scrollDirection: scrollDirection,
        controller: controller,
        padding: padding,
        physics: physics,
        primary: primary,
        reverse: reverse,
        keyboardDismissBehavior: keyboardDismissBehavior,
        clipBehavior: clipBehavior,
        child: child,
      ),
    );
  }
}

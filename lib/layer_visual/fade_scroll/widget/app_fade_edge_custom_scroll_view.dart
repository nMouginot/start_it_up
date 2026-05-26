import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:start_it_up/layer_visual/fade_scroll/widget/app_fade_mask.dart';

class AppFadeEdgeCustomScrollView extends StatelessWidget {
  final List<Widget> slivers;
  final double fadeSize;
  final Axis scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? primary;
  final bool reverse;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Clip clipBehavior;
  final bool shrinkWrap;
  final Key? center;
  final double anchor;
  final DragStartBehavior dragStartBehavior;

  const AppFadeEdgeCustomScrollView({
    super.key,
    required this.slivers,
    this.fadeSize = 16.0,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.primary,
    this.reverse = false,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.clipBehavior = Clip.hardEdge,
    this.shrinkWrap = false,
    this.center,
    this.anchor = 0.0,
    this.dragStartBehavior = DragStartBehavior.start,
  });

  @override
  Widget build(BuildContext context) {
    return AppFadeMask(
      fadeSize: fadeSize,
      scrollDirection: scrollDirection,
      child: CustomScrollView(
        slivers: slivers,
        scrollDirection: scrollDirection,
        controller: controller,
        physics: physics,
        primary: primary,
        reverse: reverse,
        keyboardDismissBehavior: keyboardDismissBehavior,
        clipBehavior: clipBehavior,
        shrinkWrap: shrinkWrap,
        center: center,
        anchor: anchor,
        dragStartBehavior: dragStartBehavior,
      ),
    );
  }
}

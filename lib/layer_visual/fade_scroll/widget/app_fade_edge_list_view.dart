import 'package:flutter/material.dart';

import 'app_fade_mask.dart';

class AppFadeEdgeListView extends StatelessWidget {
  final Widget child;
  final double fadeSize;
  final Axis scrollDirection;

  const AppFadeEdgeListView._({
    super.key,
    required this.child,
    required this.fadeSize,
    required this.scrollDirection,
  });

  factory AppFadeEdgeListView.builder({
    Key? key,
    required int itemCount,
    required Widget Function(BuildContext context, int index) itemBuilder,
    double fadeSize = 8.0,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool? primary,
    bool reverse = false,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    Clip clipBehavior = Clip.hardEdge,
    bool shrinkWrap = false,
  }) {
    return AppFadeEdgeListView._(
      key: key,
      fadeSize: fadeSize,
      scrollDirection: scrollDirection,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        scrollDirection: scrollDirection,
        controller: controller,
        padding: padding,
        physics: physics,
        primary: primary,
        reverse: reverse,
        keyboardDismissBehavior: keyboardDismissBehavior,
        clipBehavior: clipBehavior,
        shrinkWrap: shrinkWrap,
      ),
    );
  }

  factory AppFadeEdgeListView.separated({
    Key? key,
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
    required Widget Function(BuildContext, int) separatorBuilder,
    double fadeSize = 8.0,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool? primary,
    bool reverse = false,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    Clip clipBehavior = Clip.hardEdge,
    bool shrinkWrap = false,
  }) {
    return AppFadeEdgeListView._(
      key: key,
      fadeSize: fadeSize,
      scrollDirection: scrollDirection,
      child: ListView.separated(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
        scrollDirection: scrollDirection,
        controller: controller,
        padding: padding,
        physics: physics,
        primary: primary,
        reverse: reverse,
        keyboardDismissBehavior: keyboardDismissBehavior,
        clipBehavior: clipBehavior,
        shrinkWrap: shrinkWrap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppFadeMask(
      fadeSize: fadeSize,
      scrollDirection: scrollDirection,
      child: child,
    );
  }
}

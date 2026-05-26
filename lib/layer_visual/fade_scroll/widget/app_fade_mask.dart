import 'package:flutter/material.dart';

class AppFadeMask extends StatelessWidget {
  final Widget child;
  final double fadeSize;
  final Axis scrollDirection;

  const AppFadeMask({
    super.key,
    required this.child,
    this.fadeSize = 8.0,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        final isVertical = scrollDirection == Axis.vertical;
        final extent = isVertical ? bounds.height : bounds.width;

        return LinearGradient(
          begin: isVertical ? Alignment.topCenter : Alignment.centerLeft,
          end: isVertical ? Alignment.bottomCenter : Alignment.centerRight,
          colors: const [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0.0, fadeSize / extent, 1.0 - fadeSize / extent, 1.0],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}

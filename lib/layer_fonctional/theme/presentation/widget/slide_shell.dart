import 'package:flutter/material.dart';

import '../../domain/entity/slide_theme.dart';
import 'theme_image_source.dart';

class SlideShell extends StatelessWidget {
  final SlideTheme theme;
  final int pageNumber;
  final int totalPages;
  final Widget child;

  const SlideShell({
    super.key,
    required this.theme,
    required this.pageNumber,
    required this.totalPages,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundImage = theme.assets.backgroundImageUrl;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.backgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: themeImageProvider(backgroundImage),
                fit: BoxFit.cover,
                opacity: 0.60,
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Stack(
          children: [
            Positioned.fill(child: child),
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                '$pageNumber / $totalPages',
                style: theme.body(
                  color: theme.colors.textColor.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

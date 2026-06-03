import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../theme/presentation/widget/slide_shell.dart';
import '../../../theme/presentation/widget/theme_image_source.dart';

class SlideTimeframe extends Slide {
  const SlideTimeframe({
    super.key,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required super.theme,
  }) : super(
         configuration: const FlutterDeckSlideConfiguration(route: '/intro'),
       );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final logo = theme.assets.logoUrl;
    return FlutterDeckSlide.blank(
      builder: (_) => SlideShell(
        theme: theme,
        pageNumber: pageNumber,
        totalPages: totalPages,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sprint Review', style: theme.display()),
                  const SizedBox(height: 24),
                  Text(
                    'Du ${timeframe.start.formattedDayMonthYear} au ${timeframe.end.formattedDayMonthYear}',
                    style: theme.headline(color: theme.colors.accentColor),
                  ),
                ],
              ),
            ),
            if (logo != null)
              Positioned(
                top: 0,
                right: 0,
                child: themeImage(logo, height: 72),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import 'slide.dart';

class SlideTimeframe extends Slide {
  final DateTime start;
  final DateTime end;

  SlideTimeframe({
    super.key,
    required super.pageNumber,
    required super.totalPages,
    required this.start,
    required this.end,
  }) : super(
         configuration: const FlutterDeckSlideConfiguration(route: '/intro'),
       );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sprint Review', style: theme.textTheme.displayMedium),
            const SizedBox(height: 24),
            Text(
              'Du ${start.formattedDayMonthYear} au ${end.formattedDayMonthYear}',
              style: theme.textTheme.headlineSmall,
            ),
            const Spacer(),
            Text(
              '$pageNumber / $totalPages',
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

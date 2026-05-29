import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../domain/entity/sprint_timeframe.dart';

class SprintIntroSlide extends FlutterDeckSlideWidget {
  final SprintTimeframe timeframe;

  const SprintIntroSlide({super.key, required this.timeframe})
    : super(
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
              'Du ${timeframe.start.formattedDayMonthYear} au ${timeframe.end.formattedDayMonthYear}',
              style: theme.textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../theme/domain/entity/slide_theme.dart';
import 'timeframe.dart';

abstract class Slide extends FlutterDeckSlideWidget {
  final int pageNumber;
  final int totalPages;
  final Timeframe timeframe;
  final SlideTheme theme;

  const Slide({
    super.key,
    required this.pageNumber,
    required this.totalPages,
    required this.timeframe,
    required this.theme,
    required FlutterDeckSlideConfiguration configuration,
  }) : super(configuration: configuration);

  @override
  FlutterDeckSlide build(BuildContext context);
}

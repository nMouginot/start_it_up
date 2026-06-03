import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import 'timeframe.dart';

abstract class Slide extends FlutterDeckSlideWidget {
  final int pageNumber;
  final int totalPages;
  final Timeframe timeframe;

  const Slide({
    super.key,
    required this.pageNumber,
    required this.totalPages,
    required this.timeframe,
    required FlutterDeckSlideConfiguration configuration,
  }) : super(configuration: configuration);

  @override
  FlutterDeckSlide build(BuildContext context);
}

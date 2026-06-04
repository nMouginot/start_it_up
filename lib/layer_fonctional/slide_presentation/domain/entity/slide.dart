import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../theme/domain/entity/slide_theme.dart';
import 'timeframe.dart';

abstract class Slide extends FlutterDeckSlideWidget {
  final String instanceId;
  final int pageNumber;
  final int totalPages;
  final Timeframe timeframe;
  final SlideTheme theme;

  const Slide({
    super.key,
    required this.instanceId,
    required this.pageNumber,
    required this.totalPages,
    required this.timeframe,
    required this.theme,
    required FlutterDeckSlideConfiguration configuration,
  }) : super(configuration: configuration);

  String get templateKey;

  String get summary;

  Slide copyWithCore({
    int? pageNumber,
    int? totalPages,
    Timeframe? timeframe,
    SlideTheme? theme,
  });

  @override
  FlutterDeckSlide build(BuildContext context);

  Widget buildSettings(BuildContext context, ValueChanged<Slide> onChanged);
}

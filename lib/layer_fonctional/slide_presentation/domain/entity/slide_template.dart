import 'package:flutter/material.dart';

import '../../../theme/domain/entity/slide_theme.dart';
import 'slide.dart';
import 'timeframe.dart';

class SlideTemplate {
  final String key;
  final String label;
  final IconData icon;
  final Slide Function({
    required Timeframe timeframe,
    required SlideTheme theme,
  })
  createDefault;

  const SlideTemplate({
    required this.key,
    required this.label,
    required this.icon,
    required this.createDefault,
  });
}

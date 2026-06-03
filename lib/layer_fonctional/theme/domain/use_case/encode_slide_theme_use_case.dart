import 'dart:convert';

import '../entity/slide_theme.dart';

class EncodeSlideThemeUseCase {
  const EncodeSlideThemeUseCase();

  String execute(SlideTheme theme) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(theme.toJson());
  }
}

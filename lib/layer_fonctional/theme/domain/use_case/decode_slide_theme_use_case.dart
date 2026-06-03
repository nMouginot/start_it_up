import 'dart:convert';

import '../entity/slide_theme.dart';

class DecodeSlideThemeUseCase {
  const DecodeSlideThemeUseCase();

  SlideTheme execute(String rawJson) {
    final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
    return SlideTheme.fromJson(decoded);
  }
}

import 'package:flutter/material.dart';

Color parseThemeHex(String hex) {
  final cleaned = hex.replaceFirst('#', '').padLeft(6, '0');
  final value = int.parse(cleaned, radix: 16);
  return Color(0xFF000000 | value);
}

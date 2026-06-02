import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

abstract class Slide extends FlutterDeckSlideWidget {
  final int pageNumber;
  final int totalPages;

  Slide({
    super.key,
    required this.pageNumber,
    required this.totalPages,
    required FlutterDeckSlideConfiguration configuration,
  }) : super(configuration: configuration);

  @override
  FlutterDeckSlide build(BuildContext context);
}

import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../domain/entity/sprint_presentation.dart';
import 'slides/projet_objectifs_slide.dart';
import 'slides/sprint_intro_slide.dart';
import 'slides/sprint_overview_slide.dart';

/// Renders a flutter_deck deck from already-built [SprintPresentation] data.
///
/// flutter_deck's [FlutterDeckApp] is the deck's root widget; this page is
/// pushed full-screen by [SprintSetupPage] so it owns the navigation stack.
class SprintDeckPage extends StatelessWidget {
  final SprintPresentation presentation;

  const SprintDeckPage({super.key, required this.presentation});

  @override
  Widget build(BuildContext context) {
    final slides = <FlutterDeckSlideWidget>[
      SprintIntroSlide(timeframe: presentation.timeframe),
      SprintOverviewSlide(presentation: presentation),
      ...presentation.blocks.map(
        (block) => ProjetObjectifsSlide(block: block),
      ),
    ];

    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        footer: FlutterDeckFooterConfiguration(showSlideNumbers: true),
      ),
      slides: slides,
    );
  }
}

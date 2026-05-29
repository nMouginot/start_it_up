import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../domain/entity/slide_presentation.dart';
import '../presentation_launcher.dart';
import 'slides/project_objectifs_slide.dart';
import 'slides/intro_slide.dart';
import 'slides/overview_slide.dart';

/// Root widget for the running deck.
///
/// Swapped in at the application root by `main.dart` when the
/// [PresentationLauncher] holds a presentation, so `flutter_deck` owns its
/// own `MaterialApp` / `GoRouter` and there is no conflict with the main
/// app's router.
///
/// Pressing Escape dismisses the deck and brings the main app back.
class SlideDeckApp extends StatelessWidget {
  final SlidePresentation presentation;

  const SlideDeckApp({super.key, required this.presentation});

  @override
  Widget build(BuildContext context) {
    final slides = <FlutterDeckSlideWidget>[
      IntroSlide(timeframe: presentation.timeframe),
      OverviewSlide(presentation: presentation),
      ...presentation.blocks.map(
        (block) => ProjectObjectifsSlide(block: block),
      ),
    ];

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.escape):
            locator<PresentationLauncher>().dismiss,
      },
      child: Focus(
        autofocus: true,
        skipTraversal: true,
        child: FlutterDeckApp(
          configuration: const FlutterDeckConfiguration(
            footer: FlutterDeckFooterConfiguration(showSlideNumbers: true),
          ),
          slides: slides,
        ),
      ),
    );
  }
}

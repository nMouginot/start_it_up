import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../domain/entity/slide_presentation.dart';
import '../presentation_launcher.dart';

class SlideDeckApp extends StatelessWidget {
  final SlidePresentation presentation;

  const SlideDeckApp({super.key, required this.presentation});

  @override
  Widget build(BuildContext context) {
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
          slides: presentation.slides,
        ),
      ),
    );
  }
}

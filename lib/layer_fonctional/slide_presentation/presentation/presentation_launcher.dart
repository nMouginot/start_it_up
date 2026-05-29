import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

import '../domain/entity/slide_presentation.dart';

/// URL path that the deck's first slide is registered on.
const String _deckEntryPath = '/intro';

/// URL path the main app returns to after the deck is dismissed.
const String _setupPagePath = '/presentation';

/// Owns the "deck mode" state for the whole app.
///
/// When [value] is non-null, the application root must swap from the regular
/// router-based UI to the full-screen `FlutterDeckApp`, so flutter_deck can
/// own its own MaterialApp / GoRouter without conflicting with the main app
/// router.
///
/// Before each swap we silently rewrite the browser URL via
/// `history.replaceState` (which does NOT fire `popstate`, so the currently
/// mounted router is not notified and cannot throw `GoException`). The
/// router that mounts AFTER the swap reads the freshly-rewritten URL when it
/// boots and lands on a route it knows.
class PresentationLauncher extends ValueNotifier<SlidePresentation?> {
  PresentationLauncher() : super(null);

  bool get isRunning => value != null;

  void launch(SlidePresentation presentation) {
    _silentlyReplaceUrl(_deckEntryPath);
    value = presentation;
  }

  void dismiss() {
    _silentlyReplaceUrl(_setupPagePath);
    value = null;
  }

  void _silentlyReplaceUrl(String url) {
    if (!kIsWeb) return;
    web.window.history.replaceState(null, '', url);
  }
}

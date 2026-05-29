import 'package:arb_translation/arb_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'layer_fonctional/sprint_presentation/domain/entity/sprint_presentation.dart';
import 'layer_fonctional/sprint_presentation/presentation/presentation_launcher.dart';
import 'layer_fonctional/sprint_presentation/presentation/sprint_deck/sprint_deck_app.dart';
import 'layer_technical/dependency_injection/app_dependency_injection.dart';
import 'layer_technical/i18n/extension/arb_translation_extension.dart';
import 'layer_technical/i18n/l10n/app_localizations.dart';
import 'layer_technical/i18n/widget/locale_picker/locale_picker_cubit.dart';
import 'layer_technical/navigation/data/app_router.dart';
import 'layer_technical/theme/data/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await appDependencyInjection();

  runApp(
    BlocProvider(create: (context) => LocalePickerCubit(), child: const Root()),
  );
}

/// Application root.
///
/// Listens to [PresentationLauncher] and swaps between the regular router
/// app and the full-screen [SprintDeckApp]. The swap happens at the root so
/// flutter_deck owns its own MaterialApp / GoRouter without conflicting with
/// the main go_router.
class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final launcher = locator<PresentationLauncher>();
    return ValueListenableBuilder<SprintPresentation?>(
      valueListenable: launcher,
      builder: (_, presentation, __) => presentation == null
          ? MainApp()
          : SprintDeckApp(presentation: presentation),
    );
  }
}

class MainApp extends StatelessWidget {
  final GoRouter _navigation = locator<AppRouter>().router;

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = BlocProvider.of<LocalePickerCubit>(context);
    final currentLocale = localeCubit.state;

    return MaterialApp.router(
      theme: appTheme,
      locale: currentLocale,
      routerConfig: _navigation,
      debugShowCheckedModeBanner: false,
      supportedLocales: TranslationLanguage.values
          .map((lang) => lang.toLocale)
          .toList(),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
    );
  }
}

import 'package:arb_translation/arb_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'layer_technical/dependency_injection/app_dependency_injection.dart';
import 'layer_technical/i18n/extension/arb_translation_extension.dart';
import 'layer_technical/i18n/l10n/app_localizations.dart';
import 'layer_technical/i18n/widget/locale_picker/locale_picker_cubit.dart';
import 'layer_technical/navigation/data/app_router.dart';
import 'layer_technical/theme/data/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appDependencyInjection();

  runApp(BlocProvider(create: (context) => LocaleCubit(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  final GoRouter _navigation = locator<AppRouter>().router;

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.watch<LocaleCubit>();
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

// ignore_for_file: deprecated_member_use

import 'package:arb_translation/arb_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_visual/atom_label/widget/atom_label.dart';
import '../../extension/arb_translation_extension.dart';
import '../../l10n/app_localizations.dart';
import 'locale_picker_cubit.dart';

class LocalePicker extends StatelessWidget {
  const LocalePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<LocalePickerCubit, Locale>(
              builder: (context, locale) {
                final translate = AppLocalizations.of(context)!;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AtomLabel.small(text: translate.selectedLanguage),
                        AtomLabel.mediumBold(
                          text: TranslationLanguage.values
                              .firstWhere(
                                (languageEnum) =>
                                    languageEnum.languageCode ==
                                    locale.languageCode,
                              )
                              .selectorName,
                        ),
                      ],
                    ),

                    ElevatedButton.icon(
                      onPressed: () => _showLocaleDialog(context),
                      label: Text(translate.updateLanguage),
                      icon: const Icon(Icons.language),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLocaleDialog(BuildContext context) {
    final cubit = BlocProvider.of<LocalePickerCubit>(context);
    final currentLocale = cubit.state;

    showDialog(
      context: context,
      builder: (context) => BlocBuilder<LocalePickerCubit, Locale>(
        builder: (context, locale) {
          final listOfLanguages = TranslationLanguage.values;

          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.selectNewLanguage),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfLanguages.length,
                itemBuilder: (context, index) {
                  final language = listOfLanguages[index];
                  return RadioListTile<Locale>(
                    title: Text(
                      language.selectorName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    value: language.toLocale,
                    groupValue: currentLocale,
                    onChanged: (value) {
                      cubit.setLocale(value!);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

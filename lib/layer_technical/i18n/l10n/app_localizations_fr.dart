// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get updateLanguage => 'Changer la langue';

  @override
  String get deliveryCost => 'Frais de livraison: ';

  @override
  String get selectedLanguage => 'Langue';

  @override
  String get selectNewLanguage => 'Sélectionnez une langue';

  @override
  String get addNewProduct => 'Ajouter un nouveau produit';

  @override
  String get totalPriceWithoutTax => 'Total hors taxe: ';

  @override
  String get vat => 'TVA: ';

  @override
  String get fullPrice => 'Total à payer: ';

  @override
  String priceFormated(num price) {
    final intl.NumberFormat priceNumberFormat =
        intl.NumberFormat.simpleCurrency(locale: localeName);
    final String priceString = priceNumberFormat.format(price);

    return '$priceString';
  }

  @override
  String percentFormated(num percent) {
    final intl.NumberFormat percentNumberFormat =
        intl.NumberFormat.percentPattern(localeName);
    final String percentString = percentNumberFormat.format(percent);

    return '$percentString';
  }

  @override
  String confirmBasketWithXProduct(num products) {
    String _temp0 = intl.Intl.pluralLogic(
      products,
      locale: localeName,
      other: 'Valider mon panier avec $products produits',
      one: 'Acheter votre produit',
      zero: 'Votre panier est vide',
    );
    return '$_temp0';
  }

  @override
  String productType(String productTypeVariable) {
    String _temp0 = intl.Intl.selectLogic(productTypeVariable, {
      'electronics': 'Électronique',
      'clothing': 'Vêtements',
      'home': 'Maison',
      'books': 'Livres',
      'sports': 'Sport',
      'other': 'inconnu',
    });
    return '$_temp0';
  }
}

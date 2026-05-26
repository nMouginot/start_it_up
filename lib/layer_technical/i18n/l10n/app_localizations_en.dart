// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get updateLanguage => 'Change language';

  @override
  String get deliveryCost => 'Delivery cost: ';

  @override
  String get selectedLanguage => 'language';

  @override
  String get selectNewLanguage => 'Select a language';

  @override
  String get addNewProduct => 'Add a new product';

  @override
  String get totalPriceWithoutTax => 'Total excluding tax: ';

  @override
  String get vat => 'VAT: ';

  @override
  String get fullPrice => 'Total to pay: ';

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
      other: 'Validate my cart with $products products',
      one: 'Buy your product',
      zero: 'Your cart is empty',
    );
    return '$_temp0';
  }

  @override
  String productType(String productTypeVariable) {
    String _temp0 = intl.Intl.selectLogic(productTypeVariable, {
      'electronics': 'Electronics',
      'clothing': 'Clothing',
      'home': 'Home',
      'books': 'Books',
      'sports': 'Sports',
      'other': 'unknown',
    });
    return '$_temp0';
  }
}

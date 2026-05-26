// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get updateLanguage => 'غير اللغة';

  @override
  String get deliveryCost => 'تكلفة التوصيل: ';

  @override
  String get selectedLanguage => 'اللغة ';

  @override
  String get selectNewLanguage => 'اختر لغة';

  @override
  String get addNewProduct => 'أضف منتجًا جديدًا';

  @override
  String get totalPriceWithoutTax => 'الإجمالي بدون ضريبة: ';

  @override
  String get vat => 'ضريبة القيمة المضافة: ';

  @override
  String get fullPrice => 'الإجمالي الواجب دفعه: ';

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
      other: 'أكد سلة المشتريات الخاصة بي مع $products منتجات',
      one: 'اشترِ منتجي',
      zero: 'السلة فارغة',
    );
    return '$_temp0';
  }

  @override
  String productType(String productTypeVariable) {
    String _temp0 = intl.Intl.selectLogic(productTypeVariable, {
      'electronics': 'إلكترونيات',
      'clothing': 'ملابس',
      'home': 'منزل',
      'books': 'كتب',
      'sports': 'رياضة',
      'other': 'مجهول',
    });
    return '$_temp0';
  }
}

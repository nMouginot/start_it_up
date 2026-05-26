# 🌍 **Flutter ARB Translation Generator**
**Effortless intl integration for Flutter apps with automatic ARB file generation**

- ✅ **No Manual ARB Files** – Generate `.arb` files from Dart code
- ✅ **Type-Safe Translations** – Compile-time checks with Intl
- ✅ **Plural & Gender Support** – Built-in handling for complex cases
- ✅ **Code-First Approach** – Define translations in Dart, generate ARB files


## 📌 **Installation**

1. Add `flutter_localizations` & `intl` & `arb_translation` & `generation` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^latest_version

dev_dependencies:
  arb_translation: ^latest_version

flutter:
  generate: true  
```

2. Create a `l10n.yaml` file at the root of your Flutter project with this content:
```yaml
arb-dir: lib/l10n  # Directory where your .arb files are
template-arb-file: app_fr.arb  # Base file 
output-localization-file: app_localizations.dart  # Output file name
```

3. Create a `translations.dart` file in your `lib/` directory and set it up like this:
```dart
void main() {
  final translations = [];
  ArbFileGenerator().generate(translations);
}
```
Now you can add as many `TranslationBuilder` instances as you need inside the translations array.


## 🚀 **Quick Start Guide**

### **1. Add Your First Translation**
Edit your `lib/translations.dart` file to add translation builders:

```dart
void main() {
  final translations = [
    TranslationBuilder.create()
        .key('greeting')
        .text()
        .description('personalized greeting')
        .addPlaceholder(
          'NAME',
          Placeholders.string(
            description: 'User\'s first name',
            example: 'John',
          ),
        )
        .addPlaceholder(
          'COUNT',
          Placeholders.integer(description: 'Number of unread messages'),
        )
        .addTranslation(
          TranslationLanguage.french,
          'Bonjour {NAME}, vous avez {COUNT} messages',
        )
        .addTranslation(
          TranslationLanguage.english,
          'Hello {NAME}, you have {COUNT} messages',
        )
        .build(),

    TranslationBuilder.create()
        .key('catMessage')
        .plural('cat')
        .forLanguage(TranslationLanguage.english)
        .one('one cat')
        .zero('no cat')
        .other('many cats')
        .forLanguage(TranslationLanguage.french)
        .one('un chat')
        .zero('pas de chat')
        .other('plusieurs chats')
        .build(),
  ];

  ArbFileGenerator().generate(translations);
}
```

### **2. Generate ARB and Intl Files**
Run this command to generate your translation files:
```
dart run arb_translation:translations
flutter pub get
```

This will:
- Create/update .arb files in your lib/l10n directory
- Generate the localization delegate class

### **3. Configure Localization in MaterialApp**

Set up your app to use the generated localizations by configuring the `MaterialApp`:

```dart
return MaterialApp(
  title: 'Flutter Translation Demo',
  locale: const Locale('en'),  // Default language
  supportedLocales: AppLocalizations.supportedLocales,  // Available locales
  localizationsDelegates: AppLocalizations.localizationsDelegates,  // Delegates
  home: const DemoTextTranslation(title: 'Flutter Demo Home Page'),
);
```


### **4. Using Translations in Your App**

Once your translations are generated, you can use them directly in your widgets:

```dart
Column(
  children: [
    // Basic usage with parameters
    Text(AppLocalizations.of(context)!.greetingTest(
      name: 'testName',
      count: 0,
    )),

    // Examples showing pluralization
    Text(AppLocalizations.of(context)!.greetingTest(
      name: 'testName',
      count: 1,  // Will show singular form
    )),

    Text(AppLocalizations.of(context)!.greetingTest(
      name: 'testName',
      count: 5,  // Will show plural form
    )),
  ],
)
```
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import '/setting/locale.dart';

class AppLocale {
  final Locale locale;

  AppLocale(this.locale);

  static List<String> get supportedLanguages => languages;

  static AppLocale of(BuildContext context) => Localizations.of<AppLocale>(context, AppLocale)!;

  String get(String key) => localizedValues[key]?[locale.languageCode] ?? key;
}

class AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<AppLocale> load(Locale locale) => SynchronousFuture<AppLocale>(AppLocale(locale));

  @override
  bool shouldReload(AppLocaleDelegate old) => false;
}

import 'package:appost/base/extensions/list_extensions.dart';
import 'package:appost/base/network/headers/network_headers.dart' as networkHeaders;
import 'package:flutter/material.dart';

Locale getSupportedListLocale(List<Locale> locales, Iterable<Locale> supportedLocales) {
  for (var locale in locales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        _setupLanguageCodeHeader(supportedLocale);
        return supportedLocale;
      }
    }
  }
  _setupLanguageCodeHeader(supportedLocales.first);
  return supportedLocales.first;
}

Locale getSupportedLocale(Locale locale, Iterable<Locale> supportedLocales) {
  final supportedLocale =
      supportedLocales.firstWhereOrNull((supported) => supported.languageCode == locale.languageCode) ??
          supportedLocales.first;
  _setupLanguageCodeHeader(supportedLocale);
  return supportedLocale;
}

void _setupLanguageCodeHeader(Locale locale) {
  networkHeaders.languageCodeValue = locale.languageCode;
}

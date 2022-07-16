import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  String localize(String value) {
// Getting the device's locale, which can be for example
// "en", "it", "es" or anything else
    final code = AppLocalization.of(this)?.locale.languageCode ?? "en";
    final database = AppLocalization._db;
// Checks whether the current app locale is supported
    if (database.containsKey(code)) {
      return database[code]?[value] ?? "-";
    } else {
      return database["en"]?[value] ?? "-";
    }
  }
}

class AppLocalization {
  final Locale locale;
  const AppLocalization(this.locale);
  static AppLocalization? of(BuildContext ctx) =>
      Localizations.of<AppLocalization>(ctx, AppLocalization);

  static final Map<String, Map<String, String>> _db = {
    "en": {
      "search": "Enter a word!",
      "english": "english",
      "russian": "russian",
      "german": "german",
      "french": "french",
      "finnish": "finnish",
      "EN": "EN",
      "RU": "RU",
      "DE": "DE",
      "FR": "FR",
      "FI": "FI",
    },
    "ru": {
      "search": "Введите слово",
      "english": "английский",
      "russian": "русский",
      "german": "немецкий",
      "french": "французкий",
      "finnish": "финский",
      "EN": "АНГ",
      "RU": "РУС",
      "DE": "НЕМ",
      "FR": "ФРА",
      "FI": "ФИН",
    },
    // "fr": {
    //   "search": "Entrez un mot",
    //   "english": "английский",
    //   "russian": "русский",
    //   "german": "немецкий",
    //   "french": "французкий",
    //   "finnish": "финский",
    //   "EN": "EN",
    //   "RU": "RU",
    //   "DE": "DE",
    //   "FR": "FR",
    //   "FI": "FI",
    // },
    // "de": {
    //   "search": "Geben Sie ein Wort ein",
    //   "english": "английский",
    //   "russian": "русский",
    //   "german": "немецкий",
    //   "french": "французкий",
    //   "finnish": "финский",
    //   "EN": "EN",
    //   "RU": "RU",
    //   "DE": "DE",
    //   "FR": "FR",
    //   "FI": "FI",
    // }
  };
}

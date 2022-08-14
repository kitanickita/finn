import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum LanguageType {
  finnish('FI', '🇫🇮'),
  english('EN', '🇬🇧'),
  russian('RU', '🇷🇺'),
  german('DE', '🇩🇪'),
  french('FR', '🇫🇷'),
  empty('', '');

  final String shortName;
  final String flag;

  const LanguageType(
    this.shortName,
    this.flag,
  );

  /// Parse String to [LanguageType]
  ///
  /// Can throw [Exception]
  static LanguageType parseFromString(String language) {
    switch (language) {
      case 'finnish':
        return LanguageType.finnish;
      case 'english':
        return LanguageType.english;
      case 'russian':
        return LanguageType.russian;
      case 'german':
        return LanguageType.german;
      case 'french':
        return LanguageType.french;
      default:
        throw LanguageType.empty;
    }
  }

  static String? getLocalizedShortName(
      LanguageType languageType, BuildContext context) {
    switch (languageType) {
      case LanguageType.finnish:
        return AppLocalizations.of(context)?.shortFinnish;

      case LanguageType.english:
        return AppLocalizations.of(context)?.shortEnglish;
      case LanguageType.russian:
        return AppLocalizations.of(context)?.shortRussian;
      case LanguageType.german:
        return AppLocalizations.of(context)?.shortGerman;
      case LanguageType.french:
        return AppLocalizations.of(context)?.shortFrench;
      default:
        return "";
    }
  }
}

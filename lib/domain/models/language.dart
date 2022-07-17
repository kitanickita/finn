import 'package:equatable/equatable.dart';

import 'languages.dart';

class Language extends Equatable {
  final String language;
  final String shortName;
  final String flag;

  const Language({
    required this.language,
    required this.shortName,
    required this.flag,
  });

  @override
  String toString() {
    return '''
    Language {
    language: $language,
    shortName: $shortName,
    flag: $flag
  }''';
  }

  @override
  List<Object> get props => [language, shortName, flag];
}

const Map<LanguageType, Language> languages = {
  LanguageType.english:
      Language(language: 'english', shortName: 'EN', flag: '🇬🇧'),
  LanguageType.russian:
      Language(language: 'russian', shortName: 'RU', flag: '🇷🇺'),
  LanguageType.finnish:
      Language(language: 'finnish', shortName: 'FI', flag: '🇫🇮'),
  LanguageType.german:
      Language(language: 'german', shortName: 'DE', flag: '🇩🇪'),
  LanguageType.french:
      Language(language: 'french', shortName: 'FR', flag: '🇫🇷'),
};

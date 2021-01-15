import 'package:equatable/equatable.dart';

import 'languages.dart';

class Language extends Equatable {
  final String language;
  final String shortName;
  final String flag;

  const Language({this.language, this.shortName, this.flag});

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

const Map<Languages, Language> languages = {
  Languages.english:
      Language(language: 'english', shortName: 'EN', flag: '🇬🇧'),
  Languages.russian:
      Language(language: 'russian', shortName: 'RU', flag: '🇷🇺'),
  Languages.finnish:
      Language(language: 'finnish', shortName: 'FI', flag: '🇫🇮'),
  Languages.german: Language(language: 'german', shortName: 'DE', flag: '🇩🇪'),
  Languages.french: Language(language: 'french', shortName: 'FR', flag: '🇫🇷'),
};

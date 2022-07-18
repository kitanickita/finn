enum LanguageType {
  finnish('FI', '🇫🇮'),
  english('EN', '🇬🇧'),
  russian('RU', '🇷🇺'),
  german('DE', '🇩🇪'),
  french('FR', '🇫🇷');

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
        throw Exception("Enum parsing gone wrong");
    }
  }
}

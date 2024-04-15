class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languages() {
    return [
      Language(1, "tn", "தமிழ்", "ta"),
      Language(2, "🇺🇸", "English", "en"),
      Language(3, "🇸🇦", "అయ్యే", "te"),
      Language(4, "🇮🇳", "हिंदी", "hi"),
      Language(4, "🇸🇦", "الاسم", "ar"),
    ];
  }
}

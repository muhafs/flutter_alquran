class TranslatedName {
  TranslatedName({
    this.languageName,
    this.name,
  });

  String? languageName;
  String? name;

  factory TranslatedName.fromJson(Map<String, dynamic> json) => TranslatedName(
        languageName: json["language_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language_name": languageName,
        "name": name,
      };
}

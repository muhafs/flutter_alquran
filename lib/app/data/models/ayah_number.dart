class AyahNumber {
  AyahNumber({
    this.inQuran,
    this.inSurah,
  });

  int? inQuran;
  int? inSurah;

  factory AyahNumber.fromJson(Map<String, dynamic> json) => AyahNumber(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };
}

class SurahTafsir {
  SurahTafsir({
    this.id,
  });

  String? id;

  factory SurahTafsir.fromJson(Map<String, dynamic> json) => SurahTafsir(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

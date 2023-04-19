import 'package:flutter_alquran/app/data/models/translated_name.dart';

class Surah {
  Surah({
    this.id,
    this.revelationPlace,
    this.revelationOrder,
    this.bismillahPre,
    this.nameSimple,
    this.nameComplex,
    this.nameArabic,
    this.versesCount,
    this.pages,
    this.translatedName,
  });

  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;
  TranslatedName? translatedName;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        id: json["id"],
        revelationPlace: json["revelation_place"],
        revelationOrder: json["revelation_order"],
        bismillahPre: json["bismillah_pre"],
        nameSimple: json["name_simple"],
        nameComplex: json["name_complex"],
        nameArabic: json["name_arabic"],
        versesCount: json["verses_count"],
        pages: json["pages"] == null
            ? []
            : List<int>.from(json["pages"]!.map((x) => x)),
        translatedName: json["translated_name"] == null
            ? null
            : TranslatedName.fromJson(json["translated_name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "revelation_place": revelationPlace,
        "revelation_order": revelationOrder,
        "bismillah_pre": bismillahPre,
        "name_simple": nameSimple,
        "name_complex": nameComplex,
        "name_arabic": nameArabic,
        "verses_count": versesCount,
        "pages": pages == null ? [] : List<dynamic>.from(pages!.map((x) => x)),
        "translated_name": translatedName?.toJson(),
      };
}

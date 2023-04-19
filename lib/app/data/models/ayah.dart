import 'package:flutter_alquran/app/data/models/translation.dart';

class Ayah {
  Ayah({
    this.id,
    this.verseNumber,
    this.verseKey,
    this.hizbNumber,
    this.rubElHizbNumber,
    this.rukuNumber,
    this.manzilNumber,
    this.sajdahNumber,
    this.textUthmani,
    this.chapterId,
    this.pageNumber,
    this.juzNumber,
    this.translations,
  });

  int? id;
  int? verseNumber;
  String? verseKey;
  int? hizbNumber;
  int? rubElHizbNumber;
  int? rukuNumber;
  int? manzilNumber;
  dynamic sajdahNumber;
  String? textUthmani;
  int? chapterId;
  int? pageNumber;
  int? juzNumber;
  List<Translation>? translations;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        id: json["id"],
        verseNumber: json["verse_number"],
        verseKey: json["verse_key"],
        hizbNumber: json["hizb_number"],
        rubElHizbNumber: json["rub_el_hizb_number"],
        rukuNumber: json["ruku_number"],
        manzilNumber: json["manzil_number"],
        sajdahNumber: json["sajdah_number"],
        textUthmani: json["text_uthmani"],
        chapterId: json["chapter_id"],
        pageNumber: json["page_number"],
        juzNumber: json["juz_number"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_number": verseNumber,
        "verse_key": verseKey,
        "hizb_number": hizbNumber,
        "rub_el_hizb_number": rubElHizbNumber,
        "ruku_number": rukuNumber,
        "manzil_number": manzilNumber,
        "sajdah_number": sajdahNumber,
        "text_uthmani": textUthmani,
        "chapter_id": chapterId,
        "page_number": pageNumber,
        "juz_number": juzNumber,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}

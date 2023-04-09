// URL: https://al-quraan-api.vercel.app/surah/112
// get specific Surah in Al Quran

import 'package:flutter_alquran/app/data/models/ayah.dart';
import 'package:flutter_alquran/app/data/models/revelation.dart';
import 'package:flutter_alquran/app/data/models/surah_name.dart';
import 'package:flutter_alquran/app/data/models/surah_prebismillah.dart';
import 'package:flutter_alquran/app/data/models/surah_tafsir.dart';

class SurahDetail {
  SurahDetail({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  int? number;
  int? sequence;
  int? numberOfVerses;
  SurahName? name;
  Revelation? revelation;
  SurahTafsir? tafsir;
  SurahPreBismillah? preBismillah;
  List<Ayah>? verses;

  factory SurahDetail.fromJson(Map<String, dynamic> json) => SurahDetail(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: json["name"] == null ? null : SurahName.fromJson(json["name"]),
        revelation: json["revelation"] == null
            ? null
            : Revelation.fromJson(json["revelation"]),
        tafsir: json["tafsir"] == null
            ? null
            : SurahTafsir.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"] == null
            ? null
            : SurahPreBismillah.fromJson(json["preBismillah"]),
        verses: json["verses"] == null
            ? []
            : List<Ayah>.from(json["verses"]!.map((x) => Ayah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
        "preBismillah": preBismillah?.toJson(),
        "verses": verses == null
            ? []
            : List<dynamic>.from(verses!.map((x) => x.toJson())),
      };
}

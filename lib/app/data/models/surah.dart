// URL: https://al-quraan-api.vercel.app/surah
// get list of all Surah in Al Quran

import 'package:flutter_alquran/app/data/models/revelation.dart';
import 'package:flutter_alquran/app/data/models/surah_name.dart';
import 'package:flutter_alquran/app/data/models/surah_tafsir.dart';

class Surah {
  Surah({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
  });

  int? number;
  int? sequence;
  int? numberOfVerses;
  SurahName? name;
  Revelation? revelation;
  SurahTafsir? tafsir;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
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
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
      };
}

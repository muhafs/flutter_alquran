// URL: https://al-quraan-api.vercel.app/surah/112/1
// get specific Ayah in Surah

import 'package:flutter_alquran/app/data/models/audio.dart';
import 'package:flutter_alquran/app/data/models/ayah_number.dart';
import 'package:flutter_alquran/app/data/models/ayah_tafsir.dart';
import 'package:flutter_alquran/app/data/models/ayah_text.dart';
import 'package:flutter_alquran/app/data/models/meta.dart';
import 'package:flutter_alquran/app/data/models/translation.dart';

class Ayah {
  Ayah({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  AyahNumber? number;
  Meta? meta;
  AyahText? text;
  Translation? translation;
  Audio? audio;
  AyahTafsir? tafsir;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number:
            json["number"] == null ? null : AyahNumber.fromJson(json["number"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        text: json["text"] == null ? null : AyahText.fromJson(json["text"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        audio: json["audio"] == null ? null : Audio.fromJson(json["audio"]),
        tafsir:
            json["tafsir"] == null ? null : AyahTafsir.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "meta": meta?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
        "tafsir": tafsir?.toJson(),
      };
}

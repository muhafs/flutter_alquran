import 'package:flutter_alquran/app/data/models/audio.dart';
import 'package:flutter_alquran/app/data/models/ayah_text.dart';
import 'package:flutter_alquran/app/data/models/translation.dart';

class SurahPreBismillah {
  SurahPreBismillah({
    this.text,
    this.translation,
    this.audio,
  });

  AyahText? text;
  Translation? translation;
  Audio? audio;

  factory SurahPreBismillah.fromJson(Map<String, dynamic> json) =>
      SurahPreBismillah(
        text: json["text"] == null ? null : AyahText.fromJson(json["text"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        audio: json["audio"] == null ? null : Audio.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
      };
}

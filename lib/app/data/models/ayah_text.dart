import 'package:flutter_alquran/app/data/models/transliteration.dart';

class AyahText {
  AyahText({
    this.arab,
    this.transliteration,
  });

  String? arab;
  Transliteration? transliteration;

  factory AyahText.fromJson(Map<String, dynamic> json) => AyahText(
        arab: json["arab"],
        transliteration: json["transliteration"] == null
            ? null
            : Transliteration.fromJson(json["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration?.toJson(),
      };
}

import 'package:flutter_alquran/app/data/models/tafsir_id.dart';

class AyahTafsir {
  AyahTafsir({
    this.id,
  });

  TafsirId? id;

  factory AyahTafsir.fromJson(Map<String, dynamic> json) => AyahTafsir(
        id: json["id"] == null ? null : TafsirId.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id?.toJson(),
      };
}

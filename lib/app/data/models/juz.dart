class Juz {
  Juz({
    this.id,
    this.juzNumber,
    this.verseMapping,
    this.firstVerseId,
    this.lastVerseId,
    this.versesCount,
  });

  int? id;
  int? juzNumber;
  Map<String, dynamic>? verseMapping;
  int? firstVerseId;
  int? lastVerseId;
  int? versesCount;

  factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        id: json["id"],
        juzNumber: json["juz_number"],
        verseMapping: Map.from(json["verse_mapping"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        firstVerseId: json["first_verse_id"],
        lastVerseId: json["last_verse_id"],
        versesCount: json["verses_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "juz_number": juzNumber,
        "verse_mapping": Map.from(verseMapping!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "first_verse_id": firstVerseId,
        "last_verse_id": lastVerseId,
        "verses_count": versesCount,
      };
}

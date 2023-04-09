class TafsirId {
  TafsirId({
    this.short,
    this.long,
  });

  String? short;
  String? long;

  factory TafsirId.fromJson(Map<String, dynamic> json) => TafsirId(
        short: json["short"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };
}

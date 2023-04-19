class Translation {
  Translation({
    this.id,
    this.resourceId,
    this.text,
  });

  int? id;
  int? resourceId;
  String? text;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        resourceId: json["resource_id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resource_id": resourceId,
        "text": text,
      };
}

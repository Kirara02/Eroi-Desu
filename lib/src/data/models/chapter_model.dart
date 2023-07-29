// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

class ChapterModel {
  int? id;
  int? mangaId;
  String? chapter;
  String? url;
  String? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? publish;

  ChapterModel({
    this.id,
    this.mangaId,
    this.chapter,
    this.url,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.publish,
  });

  factory ChapterModel.fromRawJson(String str) =>
      ChapterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["id"],
        mangaId: json["manga_id"],
        chapter: json["chapter"],
        url: json["url"],
        date: json["date"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        publish: json["publish"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "manga_id": mangaId,
        "chapter": chapter,
        "url": url,
        "date": date,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "publish": publish,
      };
}

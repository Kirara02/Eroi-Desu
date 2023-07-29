// To parse this JSON data, do
//
//     final comicModel = comicModelFromJson(jsonString);

import 'dart:convert';

class ComicModel {
  int? id;
  String? title;
  String? jenis;
  String? status;
  String? cover;
  String? author;
  String? genre;
  String? host;
  String? sinopsis;
  Chapter? chapter;

  ComicModel({
    this.id,
    this.title,
    this.jenis,
    this.status,
    this.cover,
    this.author,
    this.genre,
    this.host,
    this.sinopsis,
    this.chapter,
  });

  factory ComicModel.fromRawJson(String str) =>
      ComicModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        id: json["id"],
        title: json["title"],
        jenis: json["jenis"],
        status: json["status"],
        cover: json["cover"],
        author: json["author"],
        genre: json["genre"],
        host: json["host"],
        sinopsis: json["sinopsis"],
        chapter:
            json["chapter"] == null ? null : Chapter.fromJson(json["chapter"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "jenis": jenis,
        "status": status,
        "cover": cover,
        "author": author,
        "genre": genre,
        "host": host,
        "sinopsis": sinopsis,
        "chapter": chapter?.toJson(),
      };
}

class Chapter {
  int? id;
  int? mangaId;
  String? chapter;
  String? url;
  String? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? publish;

  Chapter({
    this.id,
    this.mangaId,
    this.chapter,
    this.url,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.publish,
  });

  factory Chapter.fromRawJson(String str) => Chapter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
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

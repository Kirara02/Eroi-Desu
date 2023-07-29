// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

class ImageModel {
  int? id;
  int? chapterId;
  String? url;
  String? alt;
  DateTime? createdAt;
  DateTime? updatedAt;

  ImageModel({
    this.id,
    this.chapterId,
    this.url,
    this.alt,
    this.createdAt,
    this.updatedAt,
  });

  factory ImageModel.fromRawJson(String str) =>
      ImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        chapterId: json["chapter_id"],
        url: json["url"],
        alt: json["alt"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chapter_id": chapterId,
        "url": url,
        "alt": alt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

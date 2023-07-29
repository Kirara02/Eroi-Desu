import 'dart:convert';
import 'package:eroi_desu/src/data/models/chapter_model.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/image_model.dart';

class ComicService {
  static final baseUrl = dotenv.env['BASEURL'];

  static Future<List<ComicModel>> fetchComics({
    required page,
    required limit,
  }) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/list/manga?page=$page&limit=$limit'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)['data'] as List;

        return json.map((item) => ComicModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load comics');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ChapterModel>> fetchChapters({
    required id,
  }) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/list/chapter/$id'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;

        return json.map((item) => ChapterModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load comics');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ImageModel>> fetchImages({
    required id,
  }) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/list/image/$id'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;

        return json.map((item) => ImageModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load comics');
      }
    } catch (e) {
      rethrow;
    }
  }
}

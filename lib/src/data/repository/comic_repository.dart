import 'package:eroi_desu/src/data/models/chapter_model.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';

import '../models/image_model.dart';
import '../services/comic_service.dart';

class ComicRepository {
  static Future<List<ComicModel>> getComics({
    required page,
    required limit,
  }) async {
    try {
      return await ComicService.fetchComics(page: page, limit: limit);
    } catch (e) {
      throw Exception('Failed to load comics: $e');
    }
  }

  static Future<List<ChapterModel>> getChapters({
    required id,
  }) async {
    try {
      return await ComicService.fetchChapters(id: id);
    } catch (e) {
      throw Exception('Failed to load comics: $e');
    }
  }

  static Future<List<ImageModel>> getImages({
    required id,
  }) async {
    try {
      return await ComicService.fetchImages(id: id);
    } catch (e) {
      throw Exception('Failed to load comics: $e');
    }
  }
}

import 'package:hive/hive.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';

class CacheHelper {
  static const String sourceBox = "SourceBox";
  static const String newsBox = "newsBox";

  //الفانكشن دى لو مش مفتوح ال box      return Hive.openBox<SourceModel>(sourceBox);افتحه طب لو مفتوح
  static Future<Box<SourceModel>> _openBox() async {
    if (!Hive.isBoxOpen(sourceBox)) {
      return Hive.openBox<SourceModel>(sourceBox);
    }
    return Hive.box<SourceModel>(sourceBox);
  }

  static Future<void> saveSourceResponse(String catId,SourceModel sources) async {
    var box = await _openBox();
    await box.put(catId, sources);
  }

  static Future<SourceModel> getSourceResponse(String catId) async {
    var box = await _openBox();
    SourceModel? sourceModel = box.get(catId);
    return sourceModel ?? SourceModel();
  }

  Future<void> deleteSourceResponse(String catId) async {
    var box = await _openBox();
    box.delete(catId);
  }

  static Future<Box<ArticleModel>> _openNewsBox() async {
    if (!Hive.isBoxOpen(newsBox)) {
      return Hive.openBox<ArticleModel>(newsBox);
    }
    return Hive.openBox<ArticleModel>(newsBox);
  }

  static Future<void> saveNewsResponse(
    String sourceId,
    ArticleModel articleModel,
  ) async {
    var box = await _openNewsBox();
    await box.put(sourceId, articleModel);
  }

  static Future<ArticleModel> getNewsResponse(String sourceId) async {
    var box = await _openNewsBox();
    ArticleModel? articleModel = box.get(sourceId);
    return articleModel ?? ArticleModel();
  }

  static Future<void> deleteNewsResponse(String sourceId) async {
    var box = await _openNewsBox();
    await box.delete(sourceId);
  }
}

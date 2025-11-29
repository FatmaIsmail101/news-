import 'package:news_app/feature/news/data/model/article_model.dart';

abstract class ArticleDSRemote{
  Future<ArticleModel>getArticle(String sourceId);
  Future<ArticleModel>cacheArticle(String sourceId);

}
import 'package:news_app/feature/news/data/model/article_model.dart';

abstract class ArticleRepo{
  Future<ArticleModel>getArticles(String sourceId);
}
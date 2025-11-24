import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:news_app/feature/news/domain/repo/article_repo.dart';

class ArticleUseCase{
  ArticleRepo repo;
  ArticleUseCase(this.repo);
  Future<ArticleModel>getArticle(String sourceId)async{
    return await repo.getArticles(sourceId);
  }
}
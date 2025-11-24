import 'package:news_app/feature/news/data/data_source/article_remote_ds.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';

import '../../domain/repo/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo {
  ArticleDSRemote dsRemote;

  ArticleRepoImpl(this.dsRemote);

  @override
  Future<ArticleModel> getArticles(String sourceId) async {
    try {
      var articleResponse = await dsRemote.getArticle(sourceId);
      return articleResponse;
    } catch (e) {
      throw Exception("Failed to load sources: $e");
    }
  }
}

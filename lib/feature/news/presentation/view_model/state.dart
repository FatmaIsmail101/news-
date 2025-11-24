import 'package:news_app/feature/news/data/model/article_model.dart';

abstract class ArticleState{}
class ArticleInit extends ArticleState{}
class ArticleLoading extends ArticleState{}
class ArticleError extends ArticleState{
  final String message;
  ArticleError(this.message);
}
class ArticleSuccess extends ArticleState{
  final ArticleModel model;
  ArticleSuccess(this.model);
}

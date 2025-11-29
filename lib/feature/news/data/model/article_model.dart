import 'package:hive/hive.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';
part 'article_model.g.dart';
@HiveType(typeId: 2)
class ArticleModel {
  @HiveField(0)
  String? status;
  @HiveField(1)
  int? totalResults;
  @HiveField(2)
  List<Article>? articles;

  ArticleModel({this.status, this.totalResults, this.articles});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: (json["articles"] as List)
          .map((e) => Article.fromJson(e))
          .toList(),
    );
  }
}

@HiveType(typeId: 3)
class Article {
  @HiveField(0)
  Source? source;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  String? publishedAt;
  @HiveField(7)
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      description: json["description"],
      title: json["title"],
      author: json["author"],
      content: json["content"],
      publishedAt: json["publishedAt"],
      source: json["source"] != null ? Source.fromJson(json["source"]) : null,
      url: json["url"],
      urlToImage: json["urlToImage"],
    );
  }
}

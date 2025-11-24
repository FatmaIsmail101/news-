import 'package:news_app/feature/sources/data/model/source_model.dart';

class ArticleModel {
  String? status;
  int? totalResults;
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

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
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
      source:  json["source"] != null
          ? Source.fromJson(json["source"])
          : null,
      url: json["url"],
      urlToImage: json["urlToImage"],
    );
  }
}

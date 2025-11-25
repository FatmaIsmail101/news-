import 'package:dio/dio.dart';
import 'package:news_app/core/constants/services/api_constants.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'article_remote_ds.dart';

class ArticleDSRemoteImpl implements ArticleDSRemote {
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(request: true, requestBody: true));

  @override
  Future<ArticleModel> getArticle(String sourceId) async {
    var response = await dio.get(
      ApiConstants.newsEndPoint,
      options: Options(
        headers: {"X-Api-Key": "8dd6e3411eba4da6b55188bc949ae1ab"},
      ),
      queryParameters: {"sources": sourceId},
    );
    print("DS ${response.data}");
    return ArticleModel.fromJson(response.data);
  }
}

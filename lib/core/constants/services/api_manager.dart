import 'package:dio/dio.dart';
import 'package:news_app/core/constants/services/api_constants.dart';
import 'package:news_app/core/constants/services/interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../../../feature/news/data/model/article_model.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            // printRequestHeaders: true,
            //printResponseHeaders: true,
            printResponseMessage: true,
            printRequestData: true,
            printResponseData: true,
          ),
        ),
      );
  }

  Future<Response>getApi(String endPoint,{Map<String,dynamic>?params}){
    return dio.get(endPoint,queryParameters: params);
  }
  Future<ArticleModel> getArticle({required String searchQuerry,
  required int pageNumber}) async {
    var response = await dio.get(
      ApiConstants.newsEndPoint,
      options: Options(
        headers: {"X-Api-Key": "8dd6e3411eba4da6b55188bc949ae1ab"},
      ),
      queryParameters: {"q": searchQuerry,
      "page":pageNumber.toString(),"pageSize":"10"},
    );
    print("DS ${response.data}");
    ArticleModel articleModel= ArticleModel.fromJson(response.data);
    return articleModel;
  }

}

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/services/api_constants.dart';
import 'package:news_app/core/constants/services/interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

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
}

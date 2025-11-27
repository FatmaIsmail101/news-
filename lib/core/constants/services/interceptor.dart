import 'package:dio/dio.dart';

class AuthInterceptor implements Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
   handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"X-Api-Key": "8dd6e3411eba4da6b55188bc949ae1ab"});
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

}
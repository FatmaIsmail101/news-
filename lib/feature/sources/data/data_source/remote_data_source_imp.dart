import 'package:dio/dio.dart';
import 'package:news_app/core/constants/services/api_constants.dart';
import 'package:news_app/feature/sources/data/data_source/remote_data_source.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SourceDSRemoteImpl implements SourceDSRemote {
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(request: true, requestBody: true));

  @override
  Future<SourceModel> getSourcesResponses(String catId) async {
    String? apiKey = await SecureStorageService.getApiKey();

    var response = await dio.get(
      ApiConstants.sourceEndPoint,
      queryParameters: {"category": catId},
      options: Options(
        headers: {"X-Api-Key": "8dd6e3411eba4da6b55188bc949ae1ab"},
      ),
    );
    print("DS ${response.data.runtimeType}"); // type
    print(response.data);
    //  final jsonData = json.decode(response.data);
    return SourceModel.fromJson(response.data);
  }
}

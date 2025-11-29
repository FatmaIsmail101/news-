import 'package:dio/dio.dart';
import 'package:news_app/core/caching/cache_helper.dart';
import 'package:news_app/core/constants/services/api_constants.dart';
import 'package:news_app/feature/sources/data/data_source/remote_data_source.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';

class SourceDSRemoteImpl implements SourceDSRemote {
  Dio dio = Dio();
    // ..interceptors.add(PrettyDioLogger(request: false
    //     , requestBody: false));

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
    SourceModel sourceModel=SourceModel.fromJson(response.data);
    CacheHelper.saveSourceResponse(catId,sourceModel);
    // print("DS ${response.data.runtimeType}"); // type
    // print(response.data);
    //  final jsonData = json.decode(response.data);
    return sourceModel;
  }

  @override
  Future<SourceModel> cacheSourcesResponses(String catId) {
    var cache=CacheHelper.getSourceResponse(catId);
    return cache;
  }
}

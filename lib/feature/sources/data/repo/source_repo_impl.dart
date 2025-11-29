import 'package:news_app/feature/sources/data/data_source/remote_data_source.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';

import '../../domain/repo/repo.dart';

class SourceRepoImpl implements SourceRepo {
  SourceDSRemote dsRemote;

  SourceRepoImpl(this.dsRemote);

  @override
  Future<SourceModel> getSources(String catId) async {
    try {
      var response = await dsRemote.getSourcesResponses(catId);
      return response;
    } catch (e) {
      final cached = await dsRemote.cacheSourcesResponses(catId);
      return cached;
    }
  }
}

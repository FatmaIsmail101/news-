import 'package:news_app/feature/sources/data/model/source_model.dart';

abstract class SourceDSRemote{
  Future<SourceModel>getSourcesResponses(String catId);
}

import 'package:news_app/feature/sources/data/model/source_model.dart';

abstract class SourceRepo{
  Future<SourceModel>getSources(String catId);
}
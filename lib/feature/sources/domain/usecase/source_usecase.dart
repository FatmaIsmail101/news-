import 'package:news_app/feature/sources/data/model/source_model.dart';
import 'package:news_app/feature/sources/domain/repo/repo.dart';

class SourceUseCase{
  SourceRepo repo;
  SourceUseCase(this.repo);
  Future<SourceModel>call(String catId)async{
    return await repo.getSources(catId);
  }
}

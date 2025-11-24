import 'package:bloc/bloc.dart';
import 'package:news_app/feature/news/domain/usecase/article_use_case.dart';
import 'package:news_app/feature/news/presentation/view_model/state.dart';

class ArticleBloc extends Cubit<ArticleState>{
  ArticleUseCase useCase;
  ArticleBloc(this.useCase):super(ArticleInit());
  Future<void>getArticles(String sourceId)async{
    try{
      emit(ArticleLoading());
      final article=await useCase.getArticle(sourceId);
      emit(ArticleSuccess(article));
    }catch(e){
      emit(ArticleError(e.toString()));
      print(e.toString());
    }
  }
}
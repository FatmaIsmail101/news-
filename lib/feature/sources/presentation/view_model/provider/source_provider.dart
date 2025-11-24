import 'package:bloc/bloc.dart';
import 'package:news_app/feature/sources/domain/usecase/source_usecase.dart';
import 'package:news_app/feature/sources/presentation/view_model/state.dart';

class SourceProvider extends Cubit< SourceState>{
  SourceUseCase useCase;
  SourceProvider(this.useCase):super(SourceInitial());

  Future< void>soucre(String catId)async{
    try{
      emit(SourceLoading());
      final sources = await useCase.call(catId);
      emit(SourceSuccess(sources));
    }
    catch(e){
      emit(SourceError(e.toString()));
      print(e.toString());
    }
  }
}

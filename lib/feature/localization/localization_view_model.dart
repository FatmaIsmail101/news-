import 'package:bloc/bloc.dart';

class LangModel extends Cubit<String>{
  LangModel():super("English");
  void toggle(String lang){
    if(state==lang) {
      return;
    } else if(lang=="English"){
      emit("English");
    }else{
      emit("Arabic");
    }
  }
}
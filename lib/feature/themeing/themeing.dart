import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/caching/cache_helper.dart';

class ThemeingViewModel extends Cubit<ThemeMode> {
  ThemeingViewModel() : super(ThemeMode.light){
    getTheme();
  }

  void toggleTheme(String theme) {
    if((state==ThemeMode.light&&theme=="Light")||
        (state==ThemeMode.dark&&theme=="Dark"))return;
    if(theme=="Light"){
      emit(ThemeMode.light);
      CacheHelper.saveTheme("Light");
    }
    else{
      emit(ThemeMode.dark);
      CacheHelper.saveTheme("Dark");

    }
  }
  Future<void> getTheme()async{
    var theme=await CacheHelper.getTheme();

      emit(theme=="Dark"?ThemeMode.dark:ThemeMode.light);

  }
}
